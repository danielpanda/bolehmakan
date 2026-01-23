import 'package:flutter/material.dart';

/// 🎨 App Colors - Dark Mode Premium Theme
class AppColors {
  AppColors._();

  // Primary colors (Green - Freshness & Life)
  static const primary = Color(0xFF10B981); // Emerald 500
  static const primaryLight = Color(0xFF34D399); // Emerald 400
  static const primaryDark = Color(0xFF047857); // Emerald 700

  // Background colors (Light mode - Natural & Ivory)
  static const background = Color(0xFFFAFAF9); // Stone 50 (Ivory White)
  static const surface = Color(0xFFFFFFFF); // Pure White
  static const surfaceLight = Color(0xFFF5F5F4); // Stone 100

  // Text colors (Dark for light background)
  static const textPrimary = Color(0xFF1C1917); // Stone 900
  static const textSecondary = Color(0xFF57534E); // Stone 600
  static const textMuted = Color(0xFF78716C); // Stone 500

  // Accent colors
  static const accent = Color(0xFF84CC16); // Lime 500
  static const success = Color(0xFF10B981); // Emerald 500
  static const warning = Color(0xFFF59E0B); // Amber 500
  static const danger = Color(0xFFEF4444); // Red 500

  // Gradient (Fresh Green)
  static const gradientStart = Color(0xFF10B981); // Emerald 500
  static const gradientEnd = Color(0xFF059669); // Emerald 600
}

/// 📝 App Strings
class AppStrings {
  AppStrings._();

  static const appName = 'BolehMakan';
  static const appTagline = 'Cek Keamanan Makananmu! 🍽️';
  static const searchHint = 'Cari makanan... (contoh: Bebek Goreng)';

  // Health condition labels
  static const goutLabel = 'Asam Urat';
  static const diabetesLabel = 'Diabetes';
  static const cholesterolLabel = 'Kolesterol';

  // Messages
  static const noResultsTitle = 'Makanan tidak ditemukan 🔍';
  static const noResultsSubtitle = 'Coba kata kunci lain ya!';
  static const loadingText = 'Mencari...';
  static const errorText = 'Oops! Ada kesalahan 😅';
}

/// 📐 App Sizes
class AppSizes {
  AppSizes._();

  // Padding & Margin
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;

  // Border Radius
  static const double radiusSm = 8;
  static const double radiusMd = 12;
  static const double radiusLg = 16;
  static const double radiusXl = 24;
  static const double radiusFull = 999;

  // Card sizes
  static const double cardWidth = 350;
  static const double cardHeight = 200;

  // Search bar
  static const double searchBarHeight = 56;
  static const double searchBarMaxWidth = 600;
}

/// 🔤 App TextStyles
class AppTextStyles {
  AppTextStyles._();

  static const _fontFamily = 'Inter';

  static const headline1 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    letterSpacing: -0.5,
  );

  static const headline2 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const headline3 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const bodyLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static const bodyMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static const bodySmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
  );

  static const labelLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const labelMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );
}
