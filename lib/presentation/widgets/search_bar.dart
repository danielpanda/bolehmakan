import 'package:bolehmakan/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

/// 🔍 Search Bar Widget - Premium glassmorphism style
class AppSearchBar extends StatefulWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextEditingController? controller;

  const AppSearchBar({
    super.key,
    this.hintText = AppStrings.searchHint,
    this.onChanged,
    this.onSubmitted,
    this.controller,
  });

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> with SingleTickerProviderStateMixin {
  late final AnimationController _animController;
  late final Animation<double> _scaleAnim;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnim = Tween<double>(begin: 1.0, end: 1.02).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeOutCubic),
    );
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _handleFocusChange(bool hasFocus) {
    setState(() => _isFocused = hasFocus);
    if (hasFocus) {
      _animController.forward();
    } else {
      _animController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnim,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        constraints: const BoxConstraints(maxWidth: AppSizes.searchBarMaxWidth),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.radiusXl),
          boxShadow: [
            BoxShadow(
              color:
                  _isFocused ? AppColors.primary.withOpacity(0.3) : Colors.black.withOpacity(0.2),
              blurRadius: _isFocused ? 30 : 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.radiusXl),
          child: Container(
            height: AppSizes.searchBarHeight,
            decoration: BoxDecoration(
              // 🌟 Glassmorphism effect
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.surface.withOpacity(0.9),
                  AppColors.surfaceLight.withOpacity(0.7),
                ],
              ),
              border: Border.all(
                color: _isFocused
                    ? AppColors.primary.withOpacity(0.5)
                    : AppColors.surfaceLight.withOpacity(0.5),
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(AppSizes.radiusXl),
            ),
            child: Row(
              children: [
                const SizedBox(width: AppSizes.md),

                // 🔍 Search Icon
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    Icons.search_rounded,
                    color: _isFocused ? AppColors.primary : AppColors.textSecondary,
                    size: 24,
                  ),
                ),
                const SizedBox(width: AppSizes.sm),

                // 📝 Text Field
                Expanded(
                  child: Focus(
                    onFocusChange: _handleFocusChange,
                    child: TextField(
                      controller: widget.controller,
                      onChanged: widget.onChanged,
                      onSubmitted: widget.onSubmitted,
                      style: AppTextStyles.bodyLarge,
                      cursorColor: AppColors.primary,
                      decoration: InputDecoration(
                        hintText: widget.hintText,
                        hintStyle: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textMuted,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppSizes.md),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
