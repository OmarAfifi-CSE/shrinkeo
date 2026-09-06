import 'dart:ffi';
import 'dart:io';
import 'package:flutter/foundation.dart';

/// Suspends and resumes OS processes across Windows platforms using native APIs.
class ProcessSuspender {
  static DynamicLibrary? _kernel32;
  static DynamicLibrary? _ntdll;
  static int Function(int desiredAccess, int inheritHandle, int processId)?
      _openProcess;
  static int Function(int hObject)? _closeHandle;
  static int Function(int processHandle)? _ntSuspendProcess;
  static int Function(int processHandle)? _ntResumeProcess;
  static bool _win32Initialized = false;

  static void _initWin32() {
    if (_win32Initialized) return;
    _win32Initialized = true;
    if (!Platform.isWindows) return;

    try {
      _kernel32 = DynamicLibrary.open('kernel32.dll');
      _ntdll = DynamicLibrary.open('ntdll.dll');

      _openProcess = _kernel32!.lookupFunction<
          IntPtr Function(Uint32, Int32, Uint32),
          int Function(int, int, int)>('OpenProcess');

      _closeHandle = _kernel32!.lookupFunction<
          Int32 Function(IntPtr),
          int Function(int)>('CloseHandle');

      _ntSuspendProcess = _ntdll!.lookupFunction<
          Int32 Function(IntPtr),
          int Function(int)>('NtSuspendProcess');

      _ntResumeProcess = _ntdll!.lookupFunction<
          Int32 Function(IntPtr),
          int Function(int)>('NtResumeProcess');
    } catch (e) {
      debugPrint('ProcessSuspender: Failed to load Windows native APIs: $e');
    }
  }


  /// Suspends (freezes) an OS process given its [pid].
  /// Returns `true` if successfully suspended.
  static bool suspend(int pid) {
    if (Platform.isWindows) {
      _initWin32();
      if (_openProcess == null ||
          _ntSuspendProcess == null ||
          _closeHandle == null) {
        return false;
      }
      const int processSuspendResume = 0x0800;
      final handle = _openProcess!(processSuspendResume, 0, pid);
      if (handle == 0) return false;
      try {
        final status = _ntSuspendProcess!(handle);
        return status == 0;
      } catch (e) {
        debugPrint('ProcessSuspender: Error suspending process $pid: $e');
        return false;
      } finally {
        _closeHandle!(handle);
      }
    }
    return false;
  }

  /// Resumes (unfreezes) a previously suspended OS process given its [pid].
  /// Returns `true` if successfully resumed.
  static bool resume(int pid) {
    if (Platform.isWindows) {
      _initWin32();
      if (_openProcess == null ||
          _ntResumeProcess == null ||
          _closeHandle == null) {
        return false;
      }
      const int processSuspendResume = 0x0800;
      final handle = _openProcess!(processSuspendResume, 0, pid);
      if (handle == 0) return false;
      try {
        final status = _ntResumeProcess!(handle);
        return status == 0;
      } catch (e) {
        debugPrint('ProcessSuspender: Error resuming process $pid: $e');
        return false;
      } finally {
        _closeHandle!(handle);
      }
    }
    return false;
  }
}
