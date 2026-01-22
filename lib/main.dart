import 'package:bolehmakan/core/constants/app_constants.dart';
import 'package:bolehmakan/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// 🚀 Main Entry Point
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 🔌 Initialize Supabase
  await Supabase.initialize(
    url: 'https://spjvsqqpkyexepjcpjbs.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNwanZzcXFwa3lleGVwamNwamJzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjkwMzEwODMsImV4cCI6MjA4NDYwNzA4M30.MvabNaPtPz23qRZI1ZhEL7oQzCCEWLvxlT33f8mkJ0E',
  );

  runApp(
    const ProviderScope(
      child: BolehMakanApp(),
    ),
  );
}

/// 🍽️ Main App Widget
class BolehMakanApp extends StatelessWidget {
  const BolehMakanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,

      // 🧭 Router
      routerConfig: appRouter,

      // 🎨 Theme
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.dark,
          surface: AppColors.surface,
        ),
        scaffoldBackgroundColor: AppColors.background,
        textTheme: GoogleFonts.interTextTheme(
          ThemeData.dark().textTheme,
        ),
      ),
    );
  }
}
