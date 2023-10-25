import 'package:adoptini_app/common/theme/adoptini_colors.dart';
import 'package:adoptini_app/core/home/presentation/widgets/background_widget.dart';
import 'package:adoptini_app/core/settings/presentation/pages/profile_screen/edit_profile_form.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _LoginPage();
}

class _LoginPage extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AdoptiniColors.backgroundColors,
        body: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              background(),
              EditProfileForm(),
            ],
          ),
        ),
      ),
    );
  }
}
