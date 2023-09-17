import 'package:adoptini_app/core/presentation/pages/home_screen.dart';
import 'package:adoptini_app/auth/presentation/pages/login/login_screen.dart';
import 'package:adoptini_app/auth/presentation/pages/register/register_screen.dart';
import 'package:adoptini_app/common/splash_screen.dart';
import 'package:flutter/material.dart';

class AdoptiniRouter {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';

  const AdoptiniRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const SplashScreen(),
        );
      case login:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const LoginPage(),
        );
      case register:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const RegisterScreen(),
        );
      case home:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const HomePage(),
        );
      default:
        throw Exception('Route not found!');
    }
  }
}
