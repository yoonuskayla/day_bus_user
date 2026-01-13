import 'package:day_bus_user/features/auth/presentation/pages/login_page.dart';
import 'package:day_bus_user/features/auth/presentation/pages/otp_page.dart';
import 'package:day_bus_user/features/home/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const login = '/login';
  static const home = '/home';
  static const otp = '/otp';

  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    initialLocation: login,
    routes: [
      GoRoute(
        path: login,
        name: 'login',
        builder: (_, __) => const LoginPage(),
      ),
      GoRoute(path: otp, name: 'otp', builder: (_, __) => const OtpPage()),
      GoRoute(path: home, name: 'home', builder: (_, __) => const HomePage()),
    ],
  );
}
