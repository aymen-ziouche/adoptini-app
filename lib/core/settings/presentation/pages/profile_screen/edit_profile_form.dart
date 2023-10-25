import 'package:adoptini_app/auth/data/models/user_model.dart';
import 'package:adoptini_app/auth/presentation/cubit/user/user_cubit.dart';
import 'package:adoptini_app/auth/presentation/widgets/custom_input_field.dart';
import 'package:adoptini_app/common/adoptini_dialog.dart';
import 'package:adoptini_app/common/theme/adoptini_colors.dart';
import 'package:adoptini_app/common/theme/login_theme.dart';
import 'package:adoptini_app/common/theme/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({super.key});

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> with TickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final AnimationController _animationController;
  final _nameFieldController = TextEditingController();

  bool _isSubmitted = false;
  String? _errorText;
  late UserModel _user;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 3000));

    _user = context.read<UserCubit>().user!;

    super.initState();
  }

  @override
  void dispose() {
    _nameFieldController.dispose();

    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentFocus = FocusScope.of(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AdoptiniColors.mainColor,
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.arrowLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      body: BlocConsumer<UserCubit, UserState>(listener: (context, state) {
        state.whenOrNull(
          userUpdated: (user) {
            _user = user;
            Navigator.of(context).pop();
            _nameFieldController.clear();
            AdoptiniDialog(
              context,
              mainButton: TextButton(
                style: const ButtonStyle(
                  splashFactory: NoSplash.splashFactory,
                  overlayColor: MaterialStatePropertyAll(Colors.transparent),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Close",
                  style: LoginTheme.bodyTextSmall
                      .copyWith(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 14.sp),
                ),
              ),
              title: "Profile updated",
              description: "Your Profile is updated successfully.",
              header: const Icon(
                FontAwesomeIcons.check,
                color: Colors.white,
              ),
            ).show();
          },
          error: (errorMessage) {
            AdoptiniDialog(
              context,
              mainButton: TextButton(
                style: const ButtonStyle(
                  splashFactory: NoSplash.splashFactory,
                  overlayColor: MaterialStatePropertyAll(Colors.transparent),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Close",
                  style: LoginTheme.bodyTextSmall
                      .copyWith(fontWeight: FontWeight.w600, color: Colors.blue, fontSize: 14.sp),
                ),
              ),
              title: "An error has occurred",
              description: errorMessage,
              header: Lottie.asset(
                'assets/lotties/error.json',
                height: 50.h,
                width: 50.h,
                controller: _animationController,
                onLoaded: (composition) async {
                  _animationController
                    ..forward()
                    ..repeat();
                },
              ),
            ).show();
          },
        );
      }, builder: (context, state) {
        return GestureDetector(
          onTap: () {
            if (!currentFocus.hasPrimaryFocus && currentFocus.hasFocus) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          child: Stack(
            children: [
              Positioned.fill(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutofillGroup(
                        child: Form(
                          autovalidateMode: _isSubmitted ? AutovalidateMode.always : AutovalidateMode.disabled,
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 40.h,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Image.asset("assets/images/profile.png"),
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                                Text(
                                  "Edit Profile",
                                  style: LoginTheme.titleTextStyle,
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                                CustomFormInputField(
                                  errorText: _errorText,
                                  controller: _nameFieldController,
                                  labelText: "Name",
                                  hintText: _user.name,
                                  lines: 1,
                                  numbers: false,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      _nameFieldController.text = _user.name;
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                MainButton(
                                  text: "Save",
                                  onTap: () {
                                    setState(() {
                                      _isSubmitted = true;
                                    });
                                    if (_formKey.currentState!.validate()) {
                                      if (!currentFocus.hasPrimaryFocus && currentFocus.hasFocus) {
                                        FocusManager.instance.primaryFocus?.unfocus();
                                      }
                                      if (_nameFieldController.text != _user.name) {
                                        final currentuser = _user.edit(name: _nameFieldController.text);
                                        context.read<UserCubit>().updateUser(currentuser);
                                      } else {
                                        final currentuser = _user;

                                        context.read<UserCubit>().updateUser(currentuser);
                                      }
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
