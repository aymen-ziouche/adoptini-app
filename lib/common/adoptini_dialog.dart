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
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          clipBehavior: Clip.antiAlias,
          contentPadding: const EdgeInsets.all(0.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          content: Padding(
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
                    style: GoogleFonts.leagueSpartan(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    description,
                    style: GoogleFonts.leagueSpartan(
                      fontSize: 13,
                    ),
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
        );
      },
    );
  }
}
