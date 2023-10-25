import 'package:adoptini_app/common/theme/adoptini_colors.dart';
import 'package:adoptini_app/common/theme/login_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainButton extends StatelessWidget {
  final String text;
  final Function onTap;
  const MainButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 48.h,
        decoration: BoxDecoration(
          color: AdoptiniColors.mainColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: LoginTheme.buttonText,
          ),
        ),
      ),
    );
  }
}
