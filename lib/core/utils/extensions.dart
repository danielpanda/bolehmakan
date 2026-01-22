import 'package:flutter/material.dart';

/// 📐 BuildContext Extensions
extension ContextX on BuildContext {
  // 📱 Screen size helpers
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;

  bool get isMobile => screenWidth < 600;
  bool get isTablet => screenWidth >= 600 && screenWidth < 1024;
  bool get isDesktop => screenWidth >= 1024;

  // 🎨 Theme helpers
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
}

/// 📝 String Extensions
extension StringX on String {
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  String get capitalizeWords {
    if (isEmpty) return this;
    return split(' ').map((word) => word.capitalize).join(' ');
  }
}

/// 🔢 Num Extensions
extension NumX on num {
  // spacing helpers
  SizedBox get hSpace => SizedBox(width: toDouble());
  SizedBox get vSpace => SizedBox(height: toDouble());
}
