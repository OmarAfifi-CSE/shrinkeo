import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../models/image_progress.dart';

typedef ImageProcessStarter = Future<Process> Function(String, List<String>);

/// Per-image context: callbacks, cancellation and encoder output cannot leak
/// into another item or another search attempt.
class ImageJob {
  final bool Function()? isCancelled;
  final void Function(ImageProgress)? onStatus;
  final ImageProcessStarter start;
  final double? targetKB;
  int? attempt;
  int? bestBytes;
  final _temporaryPaths = <String>{};
  bool _cancelled = false;

  void trackTemporary(String path) => _temporaryPaths.add(path);

  void cleanup() {
    for (final path in _temporaryPaths) {
      try {
        final file = File(path);
        if (file.existsSync()) file.deleteSync();
      } on FileSystemException {
        // Cleanup is best effort and must not obscure the encoder error.
      }
    }
  }

  ImageJob({
    this.isCancelled,
    this.onStatus,
    this.targetKB,
    ImageProcessStarter? start,
  }) : start = start ?? _start;

  static Future<Process> _start(String executable, List<String> args) =>
      Process.start(executable, args);

  bool get cancelled {
    _cancelled = _cancelled || (isCancelled?.call() ?? false);
    return _cancelled;
  }

  void report(ImageStage stage, [double? fraction]) {
    if (cancelled) return;
    onStatus?.call(
      ImageProgress(
        stage: stage,
        fraction: fraction,
        attempt: attempt,
        bestBytes: bestBytes,
        targetKB: targetKB,
      ),
    );
  }

  /// cwebp percentages and cjpeg's per-pass reports. A pass is deliberately
  /// not presented as overall image completion.
  static double? parseProgress(String record) {
    final pass = RegExp(r'Pass\s+(\d+)/(\d+):\s*(\d+)%').firstMatch(record);
    if (pass != null) {
      final current = int.parse(pass[1]!);
      final total = int.parse(pass[2]!);
      final percent = int.parse(pass[3]!);
      if (total < 1 || current < 1 || current > total || percent > 100) {
        return null;
      }
      return ((current - 1) + percent / 100) / total;
    }
    final match = RegExp(r'(?:^|\s)(\d{1,3})\s*%\s*$').firstMatch(record);
    if (match == null) return null;
    final percent = int.parse(match[1]!);
    return percent <= 100 ? percent / 100 : null;
  }

  Future<ProcessResult> run(
    String executable,
    List<String> args, {
    ImageStage stage = ImageStage.encoding,
    bool progress = false,
  }) async {
    if (cancelled) return ProcessResult(0, -1, '', 'Cancelled');
    report(stage);
    final process = await start(executable, args);
    var killed = false;
    void checkCancellation() {
      if (cancelled && !killed) {
        killed = true;
        process.kill();
      }
    }

    final timer = Timer.periodic(
      const Duration(milliseconds: 100),
      (_) => checkCancellation(),
    );
    checkCancellation();
    var errors = '';
    var pending = '';
    var lastPercent = -1;
    void consume(String record) {
      if (!progress || cancelled) return;
      final value = parseProgress(record);
      if (value == null) return;
      // Reserve file completion for successful validation in the cubit.
      final percent = (value * 100 + 1e-9).floor().clamp(0, 99);
      if (percent <= lastPercent) return;
      lastPercent = percent;
      report(stage, percent / 100);
    }

    final stdoutDone = process.stdout.drain<void>();
    final stderrDone = process.stderr
        .transform(const Utf8Decoder(allowMalformed: true))
        .listen((chunk) {
          errors += chunk;
          if (errors.length > 16384) {
            errors = errors.substring(errors.length - 16384);
          }
          pending += chunk;
          final records = pending.split(RegExp(r'[\r\n]'));
          pending = records.removeLast();
          for (final record in records) {
            consume(record);
          }
          if (pending.length > 4096) {
            pending = pending.substring(pending.length - 4096);
          }
        })
        .asFuture<void>();
    try {
      final results = await Future.wait<Object?>([
        process.exitCode,
        stdoutDone,
        stderrDone,
      ]);
      final code = results.first! as int;
      consume(pending);
      return ProcessResult(
        process.pid,
        cancelled ? -1 : code,
        '',
        cancelled ? 'Cancelled' : errors,
      );
    } finally {
      timer.cancel();
    }
  }
}
