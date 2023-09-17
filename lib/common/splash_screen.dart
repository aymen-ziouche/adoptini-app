import 'package:adoptini_app/auth/presentation/cubit/user/user_cubit.dart';
import 'package:adoptini_app/common/adoptini_router.dart';
import 'package:adoptini_app/common/theme/adoptini_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      context.read<UserCubit>().startApp();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserStateLoggedIn) {
          Navigator.of(context).pushReplacementNamed(
            AdoptiniRouter.home,
          );
        } else if (state is UserStateNotLoggedIn) {
          Navigator.of(context).pushReplacementNamed(AdoptiniRouter.login);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AdoptiniColors.backgroundColors,
          body: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Center(
                child: Image.asset("assets/images/logo.png"),
              )),
        );
      },
    );
  }
}
