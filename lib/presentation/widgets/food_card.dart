import 'package:bolehmakan/core/constants/app_constants.dart';
import 'package:bolehmakan/domain/entities/food_entity.dart';
import 'package:bolehmakan/presentation/widgets/status_badge.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// 🍽️ Food Card Widget - Menampilkan hasil pencarian makanan
class FoodCard extends StatelessWidget {
  final FoodEntity food;
  final VoidCallback? onTap;

  const FoodCard({
    super.key,
    required this.food,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(AppSizes.radiusLg),
            child: Container(
              padding: const EdgeInsets.all(AppSizes.md),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                border: Border.all(
                  color: AppColors.surfaceLight.withOpacity(0.5),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🍽️ Food Header
                  Row(
                    children: [
                      // 🖼️ Image
                      _buildImage(),
                      const SizedBox(width: AppSizes.md),

                      // 📝 Name & Tags
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              food.name,
                              style: AppTextStyles.headline3,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (food.tags.isNotEmpty) ...[
                              const SizedBox(height: 4),
                              _buildTags(),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: AppSizes.md),
                  const Divider(color: AppColors.surfaceLight, height: 1),
                  const SizedBox(height: AppSizes.md),

                  // 🚦 Status Indicators
                  _buildStatusRow(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: food.imageUrl != null && food.imageUrl!.isNotEmpty
          ? CachedNetworkImage(
              imageUrl: food.imageUrl!,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.primary,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.restaurant_rounded,
                color: AppColors.textMuted,
                size: 28,
              ),
            )
          : const Icon(
              Icons.restaurant_rounded,
              color: AppColors.textMuted,
              size: 28,
            ),
    );
  }

  Widget _buildTags() {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: food.tags.take(3).map((tag) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.15),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            '#$tag',
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.primaryLight,
              fontSize: 10,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildStatusRow() {
    return Row(
      children: [
        Expanded(
          child: StatusBadge(
            label: AppStrings.goutLabel,
            status: food.goutStatus,
            isCompact: true,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: StatusBadge(
            label: AppStrings.diabetesLabel,
            status: food.diabetesStatus,
            isCompact: true,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: StatusBadge(
            label: AppStrings.cholesterolLabel,
            status: food.cholesterolStatus,
            isCompact: true,
          ),
        ),
      ],
    );
  }
}
