import 'package:adoptini_app/common/on_boarding_screen.dart';
import 'package:adoptini_app/core/home/data/models/conversation_model.dart';
import 'package:adoptini_app/core/home/data/models/pet_model.dart';
import 'package:adoptini_app/core/home/presentation/pages/add_pet_screen/add_pet_screen.dart';
import 'package:adoptini_app/core/home/presentation/pages/adoptions_screen/adoptions_screen.dart';
import 'package:adoptini_app/core/home/presentation/pages/favorites_screen/favorites_screen.dart';
import 'package:adoptini_app/core/home/presentation/pages/home_screen/home_screen.dart';
import 'package:adoptini_app/auth/presentation/pages/login/login_screen.dart';
import 'package:adoptini_app/auth/presentation/pages/register/register_screen.dart';
import 'package:adoptini_app/common/splash_screen.dart';
import 'package:adoptini_app/core/home/presentation/pages/map_screen/map_screen.dart';
import 'package:adoptini_app/core/home/presentation/pages/messages_screen/messages_screen.dart';
import 'package:adoptini_app/core/home/presentation/pages/messages_screen/conversations_screen.dart';
import 'package:adoptini_app/core/home/presentation/pages/pet_screen/pet_screen.dart';
import 'package:adoptini_app/core/settings/presentation/pages/help_screen/help_screen.dart';
import 'package:adoptini_app/core/settings/presentation/pages/profile_screen/edit_profile_screen.dart';
import 'package:adoptini_app/core/settings/presentation/pages/profile_screen/profile_screen.dart';
import 'package:adoptini_app/core/settings/presentation/pages/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';

class AdoptiniRouter {
  static const String splashScreen = '/';
  static const String onBoardingScreen = '/onBoardingScreen';
  static const String loginScreen = '/login';
  static const String registerScreen = '/register';
  static const String homeScreen = '/home';
  static const String addPetScreen = '/add';
  static const String petScreen = '/petScreen';
  static const String favoritesScreen = '/favoritesScreen';
  static const String adoptionsScreen = '/adoptionsScreen';
  static const String mapScreen = '/mapScreen';
  static const String settingsScreen = '/settingsScreen';
  static const String helpScreen = '/settingsScreen/helpScreen';
  static const String profileScreen = '/settingsScreen/profileScreen';
  static const String editProfileScreen = '/settingsScreen/editProfileScreen';
  static const String messagesScreen = '/messagesScreen';
  static const String conversationScreen = '/conversationScreen';

  const AdoptiniRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splashScreen:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const SplashScreen(),
        );
      case onBoardingScreen:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const OnBoardingScreen(),
        );
      case loginScreen:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const LoginPage(),
        );
      case registerScreen:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const RegisterScreen(),
        );
      case homeScreen:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const HomePage(),
        );
      case addPetScreen:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const AddPetScreen(),
        );
      case petScreen:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => PetScreen(
            pet: routeSettings.arguments as PetModel,
          ),
        );
      case favoritesScreen:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const FavoritesScreen(),
        );
      case adoptionsScreen:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const AdoptionsScreen(),
        );
      case mapScreen:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const MapScreen(),
        );
      case settingsScreen:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const SettingsScreen(),
        );
      case helpScreen:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const HelpScreen(),
        );
      case profileScreen:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => ProfileScreen(),
        );
      case editProfileScreen:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const EditProfileScreen(),
        );
      case messagesScreen:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const ConversationsScreen(),
        );
      case conversationScreen:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => MessagesScreen(
            conversation: routeSettings.arguments as ConversationModel,
          ),
        );
      default:
        throw Exception('Route not found!');
    }
  }
}
