import 'package:adoptini_app/auth/presentation/cubit/user/user_cubit.dart';
import 'package:adoptini_app/common/adoptini_router.dart';
import 'package:adoptini_app/common/theme/adoptini_colors.dart';
import 'package:adoptini_app/core/settings/presentation/cubit/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late SettingsCubit _settingsCubit;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 3000));
    _settingsCubit = context.read<SettingsCubit>();

    Future.delayed(const Duration(seconds: 3), () {
      final firstRun = _settingsCubit.settings?.firstUse ?? true;

      if (firstRun) {
        Navigator.of(context).pushReplacementNamed(AdoptiniRouter.onBoardingScreen);

        _settingsCubit.setSettings(newSettings: _settingsCubit.settings!.copyWith(firstUse: false));
      } else {
        context.read<UserCubit>().startApp();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        state.whenOrNull(
          userLoggedIn: (user) {
            Navigator.of(context).pushReplacementNamed(
              AdoptiniRouter.homeScreen,
            );
          },
          userNotLoggedIn: () {
            if (_settingsCubit.settings!.firstUse == true) {
              Navigator.of(context).pushReplacementNamed(AdoptiniRouter.onBoardingScreen);
            } else {
              Navigator.of(context).pushReplacementNamed(AdoptiniRouter.loginScreen);
            }
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AdoptiniColors.backgroundColors,
          body: Center(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Lottie.asset(
                'assets/lotties/loading_animation.json',
                controller: _animationController,
                onLoaded: (composition) async {
                  _animationController
                    ..forward()
                    ..repeat();
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
