import 'package:adoptini_app/common/adoptini_router.dart';
import 'package:adoptini_app/common/theme/adoptini_colors.dart';
import 'package:adoptini_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdoptiniColors.backgroundColors,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100.h,
          ),
          SizedBox(
            height: 200.h,
            child: Image.asset(
              "assets/images/boarding.png",
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 100.h,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 200.h, // Adjust the height as needed
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(130.w),
                  topRight: Radius.circular(130.w),
                ),
                color: AdoptiniColors.mainColor,
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 50, bottom: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      LocaleKeys.onBoarding_title.tr(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lemon(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      LocaleKeys.onBoardin_Subtitle.tr(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lemon(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 15,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, AdoptiniRouter.loginScreen);
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 40.h, left: 40.h, right: 40.h),
                        height: 48.h,
                        decoration: BoxDecoration(
                          color: Color(0xff5E592D),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            LocaleKeys.onBoardingCTA.tr(),
                            style: GoogleFonts.lemon(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
