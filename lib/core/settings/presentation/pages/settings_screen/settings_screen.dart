import 'package:adoptini_app/auth/presentation/cubit/user/user_cubit.dart';
import 'package:adoptini_app/common/adoptini_dialog.dart';
import 'package:adoptini_app/common/adoptini_router.dart';
import 'package:adoptini_app/common/enums.dart';
import 'package:adoptini_app/common/theme/adoptini_colors.dart';
import 'package:adoptini_app/common/theme/login_theme.dart';
import 'package:adoptini_app/core/settings/presentation/cubit/settings_cubit/settings_cubit.dart';
import 'package:adoptini_app/core/settings/presentation/widgets/language_pop_dialog.dart';
import 'package:adoptini_app/core/settings/presentation/widgets/settings_row_widget.dart';
import 'package:adoptini_app/utils/extensions.dart';
import 'package:adoptini_app/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> with TickerProviderStateMixin {
  final List<Languages> appLanguages = Languages.values;
  late SettingsCubit _settingsCubit;
  late final AnimationController _animationController;

  late UserCubit _userCubit;
  @override
  void initState() {
    super.initState();
    _settingsCubit = context.read<SettingsCubit>();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 3000));

    _userCubit = context.read<UserCubit>();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdoptiniColors.backgroundColors,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
          child: BlocConsumer<UserCubit, UserState>(listener: (context, state) {
            state.whenOrNull(
              updatingLocation: () {
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
                        "Close",
                        style: LoginTheme.bodyTextSmall
                            .copyWith(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                    title: "Updating your Location",
                    description: "Please Wait...",
                    header: CircularProgressIndicator(
                      color: Colors.white,
                    )).show();
              },
              updatedLocation: () {
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
                      "Close",
                      style: LoginTheme.bodyTextSmall
                          .copyWith(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 14.sp),
                    ),
                  ),
                  title: "Success",
                  description: "Your location has been updated successfully",
                  header: const Icon(
                    FontAwesomeIcons.check,
                    color: Colors.white,
                  ),
                ).show();
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
                      "Close",
                      style: LoginTheme.bodyTextSmall
                          .copyWith(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 14.sp),
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
            return BlocConsumer<SettingsCubit, SettingsState>(
              listener: (context, state) {},
              builder: (context, state) {
                final currentLanguage = _settingsCubit.settings!.appLanguage;
                final user = _userCubit.user;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      "Settings",
                      style: GoogleFonts.leagueSpartan(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      "Account",
                      style: GoogleFonts.leagueSpartan(
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(
                                "assets/images/profile.png",
                              ),
                              radius: 30,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _userCubit.user!.name,
                                  style: GoogleFonts.leagueSpartan(
                                      color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  _userCubit.user!.email,
                                  style: GoogleFonts.leagueSpartan(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AdoptiniRouter.profileScreen,
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Color(0xffD9D9D9),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      "App Settings",
                      style: GoogleFonts.leagueSpartan(
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SettingsRowWidget(
                      title: "Languages",
                      avatarColor: AdoptiniColors.mainColor,
                      iconColor: AdoptiniColors.mainColor,
                      icon: FontAwesomeIcons.earthAmericas,
                      value: currentLanguage.toString().split(".").last.capitalize(),
                      ontap: () async {
                        await LanguagesPopDialog.show(context).then((currentLanguage) {
                          if (currentLanguage != null) {
                            _settingsCubit.setSettings(
                              newSettings: _settingsCubit.settings!.copyWith(appLanguage: currentLanguage),
                            );
                            context.setLocale(languageToLocales(currentLanguage));
                          }
                        });
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SettingsRowWidget(
                      title: "Notifications",
                      avatarColor: Color(0xff96ADE8),
                      iconColor: Color(0xff2C4BB8),
                      icon: FontAwesomeIcons.solidBell,
                      value: "",
                      ontap: () {
                        // TODO: Navigate to Notifications screen
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SettingsRowWidget(
                      title: "Location",
                      avatarColor: Color(0xff9C5EDA),
                      iconColor: Color(0xff4C2078),
                      icon: FontAwesomeIcons.locationDot,
                      value: "",
                      ontap: () {
                        AdoptiniDialog(
                          context,
                          mainButton: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();

                                _userCubit.updateUserLocation(user!.uid);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: Colors.white)),
                                child: Text(
                                  "Update My Location",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.leagueSpartan(
                                    fontSize: 22,
                                    color: AdoptiniColors.mainColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          secondaryButton: Padding(
                            padding: const EdgeInsets.all(8.0).copyWith(top: 25),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: Colors.white)),
                                child: Text(
                                  "Cancel",
                                  style: GoogleFonts.leagueSpartan(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          title: "Change Saved Location",
                          description:
                              "Are you sure you want to update your saved location to your current location?",
                          header: const Icon(
                            FontAwesomeIcons.locationDot,
                            color: Colors.white,
                          ),
                        ).show();
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SettingsRowWidget(
                      title: "Help",
                      avatarColor: Color(0xffEE5D5D),
                      iconColor: Color(0xffB63030),
                      icon: FontAwesomeIcons.lifeRing,
                      value: "",
                      ontap: () {
                        Navigator.pushNamed(context, AdoptiniRouter.helpScreen);
                      },
                    ),
                  ],
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
