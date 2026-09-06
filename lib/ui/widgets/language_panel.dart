import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_strings.dart';
import '../../core/language_helper.dart';
import '../../cubit/compression_cubit.dart';
import '../../cubit/compression_state.dart';
import '../app_colors.dart';
import 'glass_container.dart';

/// Collapsible language selection panel with search bar and flag cards.
class LanguagePanel extends StatelessWidget {
  const LanguagePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: BlocBuilder<CompressionCubit, CompressionState>(
        buildWhen: (prev, curr) =>
            prev.isLanguageExpanded != curr.isLanguageExpanded ||
            prev.languageCode != curr.languageCode,
        builder: (context, state) {
          final isRtl = LanguageHelper.isRtl(state.languageCode);
          return Directionality(
            textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
            child: AnimatedCrossFade(
              duration: const Duration(milliseconds: 250),
              sizeCurve: Curves.easeOut,
              crossFadeState: state.isLanguageExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              firstChild: const SizedBox.shrink(),
              secondChild: _LanguagePanelContent(state: state),
            ),
          );
        },
      ),
    );
  }
}

class _LanguagePanelContent extends StatefulWidget {
  final CompressionState state;

  const _LanguagePanelContent({required this.state});

  @override
  State<_LanguagePanelContent> createState() => _LanguagePanelContentState();
}

class _LanguagePanelContentState extends State<_LanguagePanelContent> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final activeColor = isDark
        ? AppColors.primaryAccentLight
        : AppColors.primaryAccent;

    // Filter languages based on search query
    final filteredCodes = LanguageHelper.supportedCodes.where((code) {
      if (_searchQuery.isEmpty) return true;
      final q = _searchQuery.toLowerCase().trim();
      final native = LanguageHelper.getNativeName(code).toLowerCase();
      final english = LanguageHelper.getEnglishName(code).toLowerCase();
      final c = code.toLowerCase();
      return native.contains(q) || english.contains(q) || c.contains(q);
    }).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: GlassContainer(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header Row
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: activeColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.language_rounded,
                    color: activeColor,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  AppStrings.selectLanguageTitle,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.3,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: activeColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: activeColor.withValues(alpha: 0.25),
                    ),
                  ),
                  child: Text(
                    AppStrings.languagesCountLabel(LanguageHelper.supportedCodes.length),
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: activeColor,
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close_rounded, size: 18),
                  onPressed: () {
                    context.read<CompressionCubit>().toggleLanguageSection();
                  },
                  tooltip: AppStrings.closeTooltip,
                  splashRadius: 18,
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Search Bar
            Container(
              height: 42,
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.black.withValues(alpha: 0.2)
                    : Colors.white.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.08)
                      : Colors.black.withValues(alpha: 0.08),
                ),
              ),
              child: Builder(
                builder: (context) {
                  final isRtl = Directionality.of(context) == TextDirection.rtl;
                  return TextField(
                    controller: _searchController,
                    textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
                    textAlign: isRtl ? TextAlign.right : TextAlign.left,
                    onChanged: (val) {
                      setState(() {
                        _searchQuery = val;
                      });
                    },
                    textAlignVertical: TextAlignVertical.center,
                    style: const TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: AppStrings.searchLanguageHint,
                      hintStyle: TextStyle(
                        fontSize: 12,
                        color: theme.textTheme.bodySmall?.color?.withValues(
                          alpha: 0.5,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        size: 18,
                        color: activeColor,
                      ),
                      suffixIcon: _searchQuery.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear_rounded, size: 16),
                              onPressed: () {
                                _searchController.clear();
                                setState(() {
                                  _searchQuery = '';
                                });
                              },
                            )
                          : null,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Language Grid
            SizedBox(
              height: 280,
              child: filteredCodes.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(24),
                      child: Center(
                        child: Text(
                          AppStrings.noLanguagesMatchSearch,
                          style: TextStyle(
                            fontSize: 13,
                            color: theme.textTheme.bodySmall?.color?.withValues(
                              alpha: 0.6,
                            ),
                          ),
                        ),
                      ),
                    )
                  : LayoutBuilder(
                      builder: (context, constraints) {
                        // Dynamically set columns based on width
                        int crossAxisCount = 4;
                        if (constraints.maxWidth < 500) {
                          crossAxisCount = 2;
                        } else if (constraints.maxWidth < 750) {
                          crossAxisCount = 3;
                        }

                        return GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                mainAxisExtent: 54,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                          itemCount: filteredCodes.length,
                          itemBuilder: (context, index) {
                            final code = filteredCodes[index];
                            final isSelected =
                                code == widget.state.languageCode;
                            final nativeName = LanguageHelper.getNativeName(
                              code,
                            );
                            final englishName = LanguageHelper.getEnglishName(
                              code,
                            );

                            return _LanguageCard(
                              code: code,
                              nativeName: nativeName,
                              englishName: englishName,
                              isSelected: isSelected,
                              activeColor: activeColor,
                              onTap: () {
                                context.read<CompressionCubit>().changeLanguage(
                                  code,
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguageCard extends StatefulWidget {
  final String code;
  final String nativeName;
  final String englishName;
  final bool isSelected;
  final Color activeColor;
  final VoidCallback onTap;

  const _LanguageCard({
    required this.code,
    required this.nativeName,
    required this.englishName,
    required this.isSelected,
    required this.activeColor,
    required this.onTap,
  });

  @override
  State<_LanguageCard> createState() => _LanguageCardState();
}

class _LanguageCardState extends State<_LanguageCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final backgroundColor = widget.isSelected
        ? widget.activeColor.withValues(alpha: isDark ? 0.2 : 0.12)
        : (_isHovered
              ? (isDark
                    ? Colors.white.withValues(alpha: 0.06)
                    : Colors.black.withValues(alpha: 0.04))
              : (isDark
                    ? Colors.black.withValues(alpha: 0.15)
                    : Colors.white.withValues(alpha: 0.4)));

    final borderColor = widget.isSelected
        ? widget.activeColor
        : (_isHovered
              ? widget.activeColor.withValues(alpha: 0.4)
              : (isDark
                    ? Colors.white.withValues(alpha: 0.08)
                    : Colors.black.withValues(alpha: 0.08)));

    return RepaintBoundary(
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: borderColor,
                width: widget.isSelected ? 1.8 : 1.0,
              ),
              boxShadow: widget.isSelected
                  ? [
                      BoxShadow(
                        color: widget.activeColor.withValues(alpha: 0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : null,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 26,
                  height: 18,
                  child: CountryFlag.fromCountryCode(
                    LanguageHelper.getCountryCode(widget.code),
                    theme: const ImageTheme(
                      width: 26,
                      height: 18,
                      shape: RoundedRectangle(4),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.nativeName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: widget.isSelected
                              ? FontWeight.w700
                              : FontWeight.w600,
                          color: widget.isSelected
                              ? widget.activeColor
                              : theme.textTheme.titleMedium?.color,
                        ),
                      ),
                      const SizedBox(height: 1),
                      Text(
                        widget.englishName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10,
                          color: theme.textTheme.bodySmall?.color?.withValues(
                            alpha: widget.isSelected ? 0.8 : 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (widget.isSelected)
                  Padding(
                    // Directional so the check hugs the text edge in RTL too.
                    padding: const EdgeInsetsDirectional.only(start: 4),
                    child: Icon(
                      Icons.check_circle_rounded,
                      size: 16,
                      color: widget.activeColor,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
