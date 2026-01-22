import 'package:bolehmakan/presentation/pages/detail/detail_page.dart';
import 'package:bolehmakan/presentation/pages/home/home_page.dart';
import 'package:go_router/go_router.dart';

/// 🧭 App Router - GoRouter Configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    // 🏠 Home Page
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),

    // 📄 Detail Page
    GoRoute(
      path: '/detail/:id',
      name: 'detail',
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? '';
        return DetailPage(foodId: id);
      },
    ),
  ],
);
