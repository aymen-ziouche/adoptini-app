import 'dart:ui';

import 'package:adoptini_app/common/theme/adoptini_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AdoptiniDialog {
  final BuildContext context;
  final Widget? header;
  final String title;
  final String description;
  final Widget mainButton;

  final Widget? secondaryButton;

  AdoptiniDialog(
    this.context, {
    this.secondaryButton,
    required this.mainButton,
    required this.title,
    required this.description,
    required this.header,
  });
  Future<dynamic> show() {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          backgroundColor: AdoptiniColors.backgroundColors.withOpacity(0),
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              decoration: BoxDecoration(
                color: AdoptiniColors.mainColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 25.h,
                    ),
                    Center(
                      child: header,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.leagueSpartan(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        description,
                        style: GoogleFonts.leagueSpartan(fontSize: 13, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    mainButton,
                    secondaryButton ?? const SizedBox.shrink(),
                    SizedBox(
                      height: 15.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
