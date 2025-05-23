import 'package:adoptini_app/auth/presentation/cubit/auth_cubit.dart';
import 'package:adoptini_app/auth/presentation/cubit/user/user_cubit.dart';
import 'package:adoptini_app/auth/presentation/widgets/custom_input_field.dart';
import 'package:adoptini_app/common/adoptini_dialog.dart';
import 'package:adoptini_app/common/adoptini_router.dart';
import 'package:adoptini_app/common/theme/adoptini_colors.dart';
import 'package:adoptini_app/common/theme/login_theme.dart';
import 'package:adoptini_app/common/theme/main_button.dart';
import 'package:adoptini_app/core/settings/presentation/cubit/settings_cubit/settings_cubit.dart';
import 'package:adoptini_app/core/settings/presentation/widgets/language_pop_dialog.dart';
import 'package:adoptini_app/generated/locale_keys.g.dart';
import 'package:adoptini_app/utils/extensions.dart';
import 'package:adoptini_app/utils/package_info_wrapper.dart';
import 'package:adoptini_app/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with TickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final AnimationController _animationController;
  late SettingsCubit _settingsCubit;

  final _emailFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isSubmitted = false;
  String? _errorText;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 3000));
    _settingsCubit = context.read<SettingsCubit>();
  }

  @override
  void dispose() {
    _emailFieldController.dispose();
    _passwordFieldController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          loginsuccess: (user) {
            context.read<UserCubit>().setUser(user);
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed(AdoptiniRouter.homeScreen);
          },
          loggingIn: () {
            AdoptiniDialog(context,
                mainButton: TextButton(
                  style: const ButtonStyle(
                    splashFactory: NoSplash.splashFactory,
                    overlayColor: MaterialStatePropertyAll(Colors.transparent),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    LocaleKeys.close.tr(),
                    style: AppTheme.bodyTextSmall
                        .copyWith(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 14.sp),
                  ),
                ),
                title: LocaleKeys.loggingIn.tr(),
                description: LocaleKeys.please_wait.tr(),
                header: CircularProgressIndicator(
                  color: Colors.white,
                )).show();
          },
          error: (errorMessage) {
            Navigator.of(context).pop();
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
                  LocaleKeys.close.tr(),
                  style: AppTheme.bodyTextSmall
                      .copyWith(fontWeight: FontWeight.w600, color: Colors.blue, fontSize: 14.sp),
                ),
              ),
              title: LocaleKeys.error.tr(),
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
                              height: 20.h,
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 150.h,
                              child: Image.asset("assets/images/profile.png"),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Text(
                              LocaleKeys.login.tr(),
                              style: AppTheme.titleTextStyle,
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            CustomFormInputField(
                              errorText: _errorText,
                              controller: _emailFieldController,
                              lines: 1,
                              numbers: false,
                              labelText: LocaleKeys.user_email.tr(),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return LocaleKeys.user_email_validator.tr();
                                }
                                if (!EmailValidator.validate(value)) {
                                  return LocaleKeys.user_email_error.tr();
                                }

                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomFormInputField(
                              errorText: _errorText,
                              controller: _passwordFieldController,
                              labelText: LocaleKeys.user_password.tr(),
                              lines: 1,
                              numbers: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return LocaleKeys.user_password_validator.tr();
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
                              height: 20.h,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  // TODO: navigate to password reset screen
                                  // Navigator.of(context).pushNamed(WergoRouter.resetPassword);
                                },
                                child: Text(
                                  LocaleKeys.forgot_password.tr(),
                                  style: AppTheme.bodyTextSmall,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            MainButton(
                              text: LocaleKeys.login.tr(),
                              onTap: () {
                                setState(() {
                                  _isSubmitted = true;
                                });
                                if (_formKey.currentState!.validate()) {
                                  if (!currentFocus.hasPrimaryFocus && currentFocus.hasFocus) {
                                    FocusManager.instance.primaryFocus?.unfocus();
                                  }
                                  context.read<AuthCubit>().login(
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
                                  LocaleKeys.are_you_new.tr(),
                                  style: AppTheme.bodyTextSmall
                                      .copyWith(fontSize: 18, color: Colors.black.withOpacity(0.5)),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushReplacementNamed(AdoptiniRouter.registerScreen);
                                  },
                                  child: Text(
                                    LocaleKeys.create_account.tr(),
                                    style: AppTheme.bodyTextSmall.copyWith(fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            Text(
                              "${LocaleKeys.version.tr()} ${PackageInfoWrapper.instance.version}",
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            SizedBox(
                              child: Center(
                                child: GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () async {
                                    await LanguagesPopDialog.show(context).then((currentLanguage) {
                                      if (currentLanguage != null) {
                                        _settingsCubit.setSettings(
                                          newSettings:
                                              _settingsCubit.settings!.copyWith(appLanguage: currentLanguage),
                                        );
                                        context.setLocale(languageToLocales(currentLanguage));
                                      }
                                    });
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
