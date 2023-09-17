import 'package:adoptini_app/auth/presentation/cubit/auth_cubit.dart';
import 'package:adoptini_app/auth/presentation/cubit/user/user_cubit.dart';
import 'package:adoptini_app/auth/presentation/widgets/custom_input_field.dart';
import 'package:adoptini_app/common/adoptini_dialog.dart';
import 'package:adoptini_app/common/adoptini_router.dart';
import 'package:adoptini_app/common/theme/adoptini_colors.dart';
import 'package:adoptini_app/common/theme/login_theme.dart';
import 'package:adoptini_app/common/theme/main_button.dart';
import 'package:adoptini_app/utils/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> with TickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final AnimationController _animationController;
  final _nameFieldController = TextEditingController();
  final _emailFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();
  final _confirmpasswordFieldController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isSubmitted = false;
  String? _errorText;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 3000));
  }

  @override
  void dispose() {
    _emailFieldController.dispose();
    _nameFieldController.dispose();
    _passwordFieldController.dispose();
    _confirmpasswordFieldController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          registersuccess: (user) {
            context.read<UserCubit>().user = user;
            Navigator.of(context).pushNamed(AdoptiniRouter.home);
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
      },
      builder: (context, state) {
        final currentFocus = FocusScope.of(context);
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
                  child: AutofillGroup(
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
                              height: 55.h,
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            Text(
                              "Sign up",
                              style: LoginTheme.titleTextStyle,
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            FormInputField(
                              errorText: _errorText,
                              controller: _nameFieldController,
                              labelText: "Name",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Name cannot be empty";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            FormInputField(
                              errorText: _errorText,
                              controller: _emailFieldController,
                              labelText: "Email",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Email cannot be empty";
                                }
                                if (!EmailValidator.validate(value)) {
                                  return "invalid email address";
                                }

                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            FormInputField(
                              errorText: _errorText,
                              controller: _passwordFieldController,
                              labelText: "Password",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Password cannot be empty";
                                }
                                return null;
                              },
                              obscureText: !_isPasswordVisible,
                              suffix: IconButton(
                                autofocus: true,
                                icon: Icon(
                                  _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                                  color: AdoptiniColors.accentColor,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            FormInputField(
                              errorText: _errorText,
                              controller: _confirmpasswordFieldController,
                              labelText: "Confirm Password",
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Please confirm password!';
                                } else if (val != _passwordFieldController.text) {
                                  return 'Passwords do not match!';
                                }
                                return null;
                              },
                              obscureText: !_isConfirmPasswordVisible,
                              suffix: IconButton(
                                autofocus: true,
                                icon: Icon(
                                  _isConfirmPasswordVisible ? Icons.visibility_off : Icons.visibility,
                                  color: AdoptiniColors.accentColor,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: () {
                                  // TODO: navigate to password reset screen
                                  // Navigator.of(context).pushNamed(WergoRouter.resetPassword);
                                },
                                child: Text(
                                  "Forgot Password ?",
                                  style: LoginTheme.bodyTextSmall,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),

                            //Login Button
                            MainButton(
                              text: "Register",
                              onTap: () {
                                setState(() {
                                  _isSubmitted = true;
                                });
                                if (_formKey.currentState!.validate()) {
                                  if (!currentFocus.hasPrimaryFocus && currentFocus.hasFocus) {
                                    FocusManager.instance.primaryFocus?.unfocus();
                                  }
                                  context.read<AuthCubit>().register(
                                        _nameFieldController.text,
                                        _emailFieldController.text.trim(),
                                        _passwordFieldController.text,
                                      );
                                }
                              },
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account? ",
                                  style: LoginTheme.bodyTextSmall
                                      .copyWith(fontSize: 18, color: Colors.black.withOpacity(0.5)),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(AdoptiniRouter.login);
                                  },
                                  child: Text(
                                    "Log in",
                                    style: LoginTheme.bodyTextSmall.copyWith(fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            SizedBox(
                              child: Center(
                                child: GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () async {
                                    // await LanguagesPopDialog.show(context).then((currentLanguage) {
                                    //   if (currentLanguage != null) {
                                    //     _settingsCubit.setSettings(
                                    //       newSettings: _settingsCubit.settings!.copyWith(appLanguage: currentLanguage),
                                    //     );
                                    //     context.setLocale(languageToLocales(currentLanguage));
                                    //   }
                                    // });
                                  },
                                  child: SizedBox(
                                    width: 100.w,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          context.locale.languageCode.capitalize(),
                                          // style: LoginTheme.loginSubTitleTextStyle,
                                        ),
                                        const SizedBox(width: 5),
                                        const Icon(
                                          Icons.language_outlined,
                                          color: AdoptiniColors.mainColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
