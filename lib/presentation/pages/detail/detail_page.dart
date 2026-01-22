import 'package:bolehmakan/core/constants/app_constants.dart';
import 'package:bolehmakan/core/constants/status_constants.dart';
import 'package:bolehmakan/domain/entities/food_entity.dart';
import 'package:bolehmakan/presentation/providers/food_providers.dart';
import 'package:bolehmakan/presentation/widgets/status_badge.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// 📄 Detail Page - Info lengkap makanan
class DetailPage extends ConsumerWidget {
  final String foodId;

  const DetailPage({
    super.key,
    required this.foodId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 📌 Coba ambil dari selected food dulu (lebih cepat)
    final selectedFood = ref.watch(selectedFoodProvider);

    // 📌 Jika tidak ada, fetch dari API
    final foodDetail = ref.watch(foodDetailProvider(foodId));

    final food = selectedFood ?? foodDetail.valueOrNull;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: food != null
          ? _buildContent(context, food)
          : foodDetail.when(
              data: (f) => f != null ? _buildContent(context, f) : _buildNotFound(context),
              loading: () => const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
              error: (error, _) => _buildError(context, error.toString()),
            ),
    );
  }

  Widget _buildContent(BuildContext context, FoodEntity food) {
    return CustomScrollView(
      slivers: [
        // 🎨 App Bar with Image
        _buildSliverAppBar(context, food),

        // 📝 Content
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🍽️ Food Name
                Text(
                  food.name,
                  style: AppTextStyles.headline1,
                ),
                const SizedBox(height: AppSizes.sm),

                // 🏷️ Tags
                if (food.tags.isNotEmpty) ...[
                  _buildTags(food.tags),
                  const SizedBox(height: AppSizes.lg),
                ],

                const SizedBox(height: AppSizes.md),

                // 🚦 Status Indicators Title
                Row(
                  children: [
                    Container(
                      width: 4,
                      height: 24,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.gradientStart,
                            AppColors.gradientEnd,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: AppSizes.sm),
                    const Text(
                      'Status Kesehatan',
                      style: AppTextStyles.headline3,
                    ),
                  ],
                ),
                const SizedBox(height: AppSizes.md),

                // 🚦 Asam Urat Status
                StatusBadge(
                  label: AppStrings.goutLabel,
                  status: food.goutStatus,
                  description: _getGoutDescription(food.goutStatus),
                ),
                const SizedBox(height: AppSizes.md),

                // 🚦 Diabetes Status
                StatusBadge(
                  label: AppStrings.diabetesLabel,
                  status: food.diabetesStatus,
                  description: _getDiabetesDescription(food.diabetesStatus),
                ),
                const SizedBox(height: AppSizes.md),

                // 🚦 Cholesterol Status
                StatusBadge(
                  label: AppStrings.cholesterolLabel,
                  status: food.cholesterolStatus,
                  description: _getCholesterolDescription(food.cholesterolStatus),
                ),

                // 📝 Notes
                if (food.notes != null && food.notes!.isNotEmpty) ...[
                  const SizedBox(height: AppSizes.xl),
                  _buildNotesSection(food.notes!),
                ],

                const SizedBox(height: AppSizes.xxl),

                // ⚠️ Disclaimer
                _buildDisclaimer(),

                const SizedBox(height: AppSizes.xxl),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSliverAppBar(BuildContext context, FoodEntity food) {
    return SliverAppBar(
      expandedHeight: 250,
      pinned: true,
      backgroundColor: AppColors.surface,
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.background.withOpacity(0.7),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.arrow_back_rounded,
            color: AppColors.textPrimary,
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            // 🖼️ Background Image or Gradient
            if (food.imageUrl != null && food.imageUrl!.isNotEmpty)
              CachedNetworkImage(
                imageUrl: food.imageUrl!,
                fit: BoxFit.cover,
                placeholder: (context, url) => _buildPlaceholderBackground(),
                errorWidget: (context, url, error) => _buildPlaceholderBackground(),
              )
            else
              _buildPlaceholderBackground(),

            // 🌟 Gradient Overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppColors.background.withOpacity(0.8),
                    AppColors.background,
                  ],
                  stops: const [0.0, 0.7, 1.0],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholderBackground() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.gradientStart, AppColors.gradientEnd],
        ),
      ),
      child: const Center(
        child: Icon(
          Icons.restaurant_rounded,
          size: 80,
          color: Colors.white24,
        ),
      ),
    );
  }

  Widget _buildTags(List<String> tags) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: tags.map((tag) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.15),
            borderRadius: BorderRadius.circular(AppSizes.radiusFull),
            border: Border.all(
              color: AppColors.primary.withOpacity(0.3),
            ),
          ),
          child: Text(
            '#$tag',
            style: AppTextStyles.labelMedium.copyWith(
              color: AppColors.primaryLight,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildNotesSection(String notes) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        border: Border.all(color: AppColors.surfaceLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.info_outline_rounded,
                size: 20,
                color: AppColors.accent,
              ),
              const SizedBox(width: 8),
              Text(
                'Catatan',
                style: AppTextStyles.labelLarge.copyWith(
                  color: AppColors.accent,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.sm),
          Text(
            notes,
            style: AppTextStyles.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildDisclaimer() {
    return Container(
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: AppColors.warning.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        border: Border.all(
          color: AppColors.warning.withOpacity(0.3),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.warning_amber_rounded,
            size: 24,
            color: AppColors.warning,
          ),
          const SizedBox(width: AppSizes.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Disclaimer',
                  style: AppTextStyles.labelLarge.copyWith(
                    color: AppColors.warning,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Informasi ini bersifat umum dan tidak menggantikan konsultasi medis. '
                  'Selalu konsultasikan dengan dokter atau ahli gizi untuk rekomendasi yang sesuai dengan kondisi kesehatan Anda.',
                  style: AppTextStyles.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotFound(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.search_off_rounded,
            size: 60,
            color: AppColors.textMuted,
          ),
          const SizedBox(height: AppSizes.md),
          const Text(
            'Makanan tidak ditemukan',
            style: AppTextStyles.headline3,
          ),
          const SizedBox(height: AppSizes.md),
          TextButton.icon(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back_rounded),
            label: const Text('Kembali'),
          ),
        ],
      ),
    );
  }

  Widget _buildError(BuildContext context, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline_rounded,
            size: 60,
            color: AppColors.danger,
          ),
          const SizedBox(height: AppSizes.md),
          const Text(AppStrings.errorText, style: AppTextStyles.headline3),
          const SizedBox(height: AppSizes.sm),
          Text(message, style: AppTextStyles.bodySmall),
          const SizedBox(height: AppSizes.md),
          TextButton.icon(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back_rounded),
            label: const Text('Kembali'),
          ),
        ],
      ),
    );
  }

  // 📝 Helper functions for descriptions
  String _getGoutDescription(HealthStatus status) {
    switch (status) {
      case HealthStatus.safe:
        return 'Rendah purin, aman untuk penderita asam urat.';
      case HealthStatus.caution:
        return 'Purin sedang, batasi konsumsi.';
      case HealthStatus.danger:
        return 'Tinggi purin, dapat memicu serangan asam urat.';
    }
  }

  String _getDiabetesDescription(HealthStatus status) {
    switch (status) {
      case HealthStatus.safe:
        return 'Indeks glikemik rendah, aman untuk gula darah.';
      case HealthStatus.caution:
        return 'Indeks glikemik sedang, perhatikan porsi.';
      case HealthStatus.danger:
        return 'Indeks glikemik tinggi, dapat menaikkan gula darah.';
    }
  }

  String _getCholesterolDescription(HealthStatus status) {
    switch (status) {
      case HealthStatus.safe:
        return 'Rendah lemak jenuh, baik untuk kolesterol.';
      case HealthStatus.caution:
        return 'Lemak jenuh sedang, konsumsi seperlunya.';
      case HealthStatus.danger:
        return 'Tinggi lemak jenuh, dapat meningkatkan kolesterol.';
    }
  }
}
