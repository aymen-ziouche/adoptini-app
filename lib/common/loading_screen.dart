import 'package:adoptini_app/common/theme/adoptini_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with TickerProviderStateMixin {
  late final AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 3000));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdoptiniColors.backgroundColors,
      extendBodyBehindAppBar: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100.h,
            decoration:
                const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/loading.png"))),
          ),
          SizedBox(
            height: 100.h,
            child: Lottie.asset(
              'assets/lotties/loading_dots.json',
              height: 100.h,
              width: 100.h,
              controller: _animationController,
              onLoaded: (composition) async {
                _animationController
                  ..forward()
                  ..repeat();
              },
            ),
          ),
        ],
      ),
    );
  }
}
