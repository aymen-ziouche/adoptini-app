import 'package:adoptini_app/common/theme/adoptini_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final String? errorText;
  final String? Function(String?) validator;
  final Widget? suffix;
  final bool obscureText;
  final bool numbers;
  final int lines;
  const CustomFormInputField({
    super.key,
    required this.controller,
    required this.labelText,
    this.suffix,
    this.obscureText = false,
    this.hintText = "",
    required this.validator,
    this.errorText,
    required this.numbers,
    required this.lines,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      onChanged: (username) {},
      validator: validator,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        letterSpacing: 0,
      ),
      maxLines: lines,
      keyboardType: numbers ? TextInputType.number : null,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        errorText: errorText,
        hintText: hintText,
        filled: true,
        fillColor: AdoptiniColors.formFillColor,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: suffix,
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.black.withOpacity(0.5),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
