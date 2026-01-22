import 'dart:async';

import 'package:bolehmakan/core/constants/app_constants.dart';
import 'package:bolehmakan/domain/entities/food_entity.dart';
import 'package:bolehmakan/presentation/providers/food_providers.dart';
import 'package:bolehmakan/presentation/widgets/food_card.dart';
import 'package:bolehmakan/presentation/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// 🏠 Home Page - Main Search Screen
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> with SingleTickerProviderStateMixin {
  late final TextEditingController _searchController;
  late final AnimationController _animController;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _animController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _animController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      ref.read(searchQueryProvider.notifier).state = value;
    });
  }

  void _onFoodTap(FoodEntity food) {
    ref.read(selectedFoodProvider.notifier).state = food;
    context.push('/detail/${food.id}');
  }

  @override
  Widget build(BuildContext context) {
    final searchResults = ref.watch(searchResultsProvider);
    final query = ref.watch(searchQueryProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // 🎨 Header
            SliverToBoxAdapter(
              child: _buildHeader(),
            ),

            // 🔍 Search Bar
            SliverToBoxAdapter(
              child: _buildSearchSection(),
            ),

            // 📋 Results or Empty State
            if (query.isEmpty)
              SliverFillRemaining(
                hasScrollBody: false,
                child: _buildEmptyState(),
              )
            else
              searchResults.when(
                data: (foods) => foods.isEmpty
                    ? SliverFillRemaining(
                        hasScrollBody: false,
                        child: _buildNoResults(),
                      )
                    : _buildResultsList(foods),
                loading: () => const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  ),
                ),
                error: (error, _) => SliverFillRemaining(
                  hasScrollBody: false,
                  child: _buildError(error.toString()),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return FadeTransition(
      opacity: _animController,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSizes.lg,
          AppSizes.xxl,
          AppSizes.lg,
          AppSizes.lg,
        ),
        child: Column(
          children: [
            // 🍽️ App Logo/Icon
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.gradientStart, AppColors.gradientEnd],
                ),
                borderRadius: BorderRadius.circular(AppSizes.radiusXl),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.4),
                    blurRadius: 30,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: const Icon(
                Icons.restaurant_menu_rounded,
                size: 40,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: AppSizes.lg),

            // 📝 Title
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [AppColors.gradientStart, AppColors.gradientEnd],
              ).createShader(bounds),
              child: const Text(
                AppStrings.appName,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: -1,
                ),
              ),
            ),
            const SizedBox(height: AppSizes.sm),

            // 📝 Tagline
            Text(
              AppStrings.appTagline,
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchSection() {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 0.3),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: _animController,
        curve: const Interval(0.2, 1.0, curve: Curves.easeOutCubic),
      )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
        child: Center(
          child: AppSearchBar(
            controller: _searchController,
            onChanged: _onSearchChanged,
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 🎨 Illustration placeholder
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: AppColors.surface,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.2),
                blurRadius: 40,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: const Icon(
            Icons.search_rounded,
            size: 60,
            color: AppColors.textMuted,
          ),
        ),
        const SizedBox(height: AppSizes.lg),
        Text(
          'Mulai cari makananmu! 🔍',
          style: AppTextStyles.headline3.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: AppSizes.sm),
        const Text(
          'Ketik nama makanan di atas',
          style: AppTextStyles.bodyMedium,
        ),
        const SizedBox(height: AppSizes.xxl),

        // 🏷️ Quick tags
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: [
              _buildQuickTag('Bebek Goreng', Icons.fastfood_rounded),
              _buildQuickTag('Nasi Goreng', Icons.rice_bowl_rounded),
              _buildQuickTag('Ayam Bakar', Icons.dinner_dining_rounded),
              _buildQuickTag('Sate Kambing', Icons.kebab_dining_rounded),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuickTag(String text, IconData icon) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          _searchController.text = text;
          ref.read(searchQueryProvider.notifier).state = text;
        },
        borderRadius: BorderRadius.circular(AppSizes.radiusFull),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.md,
            vertical: AppSizes.sm,
          ),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppSizes.radiusFull),
            border: Border.all(
              color: AppColors.surfaceLight,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 16, color: AppColors.primary),
              const SizedBox(width: 6),
              Text(text, style: AppTextStyles.labelMedium),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNoResults() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: const BoxDecoration(
            color: AppColors.surface,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.sentiment_dissatisfied_rounded,
            size: 50,
            color: AppColors.textMuted,
          ),
        ),
        const SizedBox(height: AppSizes.lg),
        const Text(
          AppStrings.noResultsTitle,
          style: AppTextStyles.headline3,
        ),
        const SizedBox(height: AppSizes.xs),
        const Text(
          AppStrings.noResultsSubtitle,
          style: AppTextStyles.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildError(String message) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error_outline_rounded,
          size: 60,
          color: AppColors.danger,
        ),
        const SizedBox(height: AppSizes.md),
        const Text(
          AppStrings.errorText,
          style: AppTextStyles.headline3,
        ),
        const SizedBox(height: AppSizes.sm),
        Text(
          message,
          style: AppTextStyles.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  SliverList _buildResultsList(List<FoodEntity> foods) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSizes.lg,
                AppSizes.xl,
                AppSizes.lg,
                AppSizes.md,
              ),
              child: Text(
                '${foods.length} hasil ditemukan',
                style: AppTextStyles.bodyMedium,
              ),
            );
          }

          final food = foods[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.lg,
              vertical: AppSizes.sm,
            ),
            child: FoodCard(
              food: food,
              onTap: () => _onFoodTap(food),
            ),
          );
        },
        childCount: foods.length + 1,
      ),
    );
  }
}
