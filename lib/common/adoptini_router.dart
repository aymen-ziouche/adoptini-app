
import 'package:adoptini_app/core/home/presentation/pages/add_pet_screen/add_pet_screen.dart';
import 'package:adoptini_app/core/home/presentation/pages/home_screen/home_screen.dart';
import 'package:adoptini_app/auth/presentation/pages/login/login_screen.dart';
import 'package:adoptini_app/auth/presentation/pages/register/register_screen.dart';
import 'package:adoptini_app/common/splash_screen.dart';
import 'package:flutter/material.dart';

class AdoptiniRouter {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String add = '/add';

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
      case add:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const AddPetScreen(),
        );
      default:
        throw Exception('Route not found!');
    }
  }
}
