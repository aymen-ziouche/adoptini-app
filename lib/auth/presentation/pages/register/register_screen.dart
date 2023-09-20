import 'package:adoptini_app/auth/presentation/pages/register/register_form.dart';
import 'package:adoptini_app/common/theme/adoptini_colors.dart';
import 'package:flutter/material.dart';






class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AdoptiniColors.backgroundColors,
        body: SizedBox(
          width: double.infinity,
          child: RegisterForm(),
        ),
      ),
    );
  }
}