import 'package:flutter/material.dart';

/// 🚦 Enum untuk status kesehatan makanan (Lampu Lalu Lintas)
enum HealthStatus {
  safe, // 🟢 Aman
  caution, // 🟡 Hati-hati
  danger, // 🔴 Bahaya
}

/// 🎨 Extension untuk mapping warna & emoji ke status
extension HealthStatusX on HealthStatus {
  Color get color {
    switch (this) {
      case HealthStatus.safe:
        return const Color(0xFF10B981); // Emerald green
      case HealthStatus.caution:
        return const Color(0xFFF59E0B); // Amber
      case HealthStatus.danger:
        return const Color(0xFFEF4444); // Red
    }
  }

  Color get backgroundColor {
    switch (this) {
      case HealthStatus.safe:
        return const Color(0xFF10B981).withOpacity(0.15);
      case HealthStatus.caution:
        return const Color(0xFFF59E0B).withOpacity(0.15);
      case HealthStatus.danger:
        return const Color(0xFFEF4444).withOpacity(0.15);
    }
  }

  String get emoji {
    switch (this) {
      case HealthStatus.safe:
        return '🟢';
      case HealthStatus.caution:
        return '🟡';
      case HealthStatus.danger:
        return '🔴';
    }
  }

  String get label {
    switch (this) {
      case HealthStatus.safe:
        return 'Aman';
      case HealthStatus.caution:
        return 'Hati-hati';
      case HealthStatus.danger:
        return 'Bahaya';
    }
  }

  IconData get icon {
    switch (this) {
      case HealthStatus.safe:
        return Icons.check_circle_rounded;
      case HealthStatus.caution:
        return Icons.warning_rounded;
      case HealthStatus.danger:
        return Icons.cancel_rounded;
    }
  }
}

/// 🔄 Helper untuk parse string dari database ke enum
HealthStatus parseHealthStatus(String? status) {
  switch (status?.toLowerCase()) {
    case 'safe':
    case 'aman':
      return HealthStatus.safe;
    case 'caution':
    case 'hati-hati':
      return HealthStatus.caution;
    case 'danger':
    case 'bahaya':
      return HealthStatus.danger;
    default:
      return HealthStatus.caution; // Default fallback
  }
}
