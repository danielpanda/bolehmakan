import 'package:bolehmakan/core/constants/app_constants.dart';
import 'package:bolehmakan/core/constants/status_constants.dart';
import 'package:flutter/material.dart';

/// 🚦 Status Badge Widget - Menampilkan indikator lampu lalu lintas
class StatusBadge extends StatelessWidget {
  final String label;
  final HealthStatus status;
  final String? description;
  final bool isCompact;

  const StatusBadge({
    super.key,
    required this.label,
    required this.status,
    this.description,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isCompact) {
      return _buildCompact();
    }
    return _buildFull();
  }

  Widget _buildCompact() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.sm,
        vertical: AppSizes.xs,
      ),
      decoration: BoxDecoration(
        color: status.backgroundColor,
        borderRadius: BorderRadius.circular(AppSizes.radiusFull),
        border: Border.all(
          color: status.color.withOpacity(0.3),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            status.icon,
            size: 14,
            color: status.color,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: AppTextStyles.labelMedium.copyWith(
              color: status.color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFull() {
    return Container(
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: status.backgroundColor,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        border: Border.all(
          color: status.color.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          // 🚦 Status Icon
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: status.color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              status.icon,
              color: status.color,
              size: 24,
            ),
          ),
          const SizedBox(width: AppSizes.md),

          // 📝 Label & Status
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTextStyles.labelLarge,
                ),
                const SizedBox(height: 2),
                Text(
                  '${status.emoji} ${status.label}',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: status.color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (description != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    description!,
                    style: AppTextStyles.bodySmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
