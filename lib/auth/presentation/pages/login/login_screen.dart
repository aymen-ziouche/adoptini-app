import 'package:adoptini_app/auth/presentation/pages/login/login_form.dart';
import 'package:adoptini_app/common/theme/adoptini_colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AdoptiniColors.backgroundColors,
      body: SizedBox(
        width: double.infinity,
        child: LoginForm(),
      ),
    );
  }
}
