import 'dart:async';

import 'package:adoptini_app/auth/data/models/user_model.dart';
import 'package:adoptini_app/auth/presentation/cubit/user/user_cubit.dart';
import 'package:adoptini_app/common/adoptini_dialog.dart';
import 'package:adoptini_app/common/adoptini_router.dart';
import 'package:adoptini_app/common/theme/adoptini_colors.dart';
import 'package:adoptini_app/core/home/presentation/widgets/background_widget.dart';
import 'package:adoptini_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserModel _user;
  final _controller = StreamController<SwipeRefreshState>.broadcast();

  Stream<SwipeRefreshState> get _stream => _controller.stream;
  @override
  void initState() {
    _user = context.read<UserCubit>().user!;

    super.initState();
  }

  Future<void> _refreshData() async {
    setState(() {
      _user = context.read<UserCubit>().user!;
    });

    _controller.sink.add(SwipeRefreshState.hidden);
  }

  @override
  void dispose() {
    _controller.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AdoptiniColors.backgroundColors,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: AdoptiniColors.mainColor,
          leading: IconButton(
            icon: const Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(AdoptiniRouter.homeScreen);
            },
          ),
        ),
        extendBodyBehindAppBar: true,
        body: BlocConsumer<UserCubit, UserState>(listener: (context, state) {
          state.whenOrNull(
            userUpdated: (user) {
              _user = user;
            },
          );
        }, builder: (context, state) {
          return SwipeRefresh.adaptive(
            stateStream: _stream,
            onRefresh: _refreshData,
            padding: const EdgeInsets.symmetric(vertical: 10),
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 600,
                          height: 600,
                          child: background(),
                        ),
                        Positioned(
                          bottom: -230,
                          left: -200,
                          child: Transform.flip(
                            flipX: true,
                            flipY: true,
                            child: Container(
                              width: 620,
                              height: 750,
                              child: background(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 60.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(FontAwesomeIcons.penToSquare),
                                    color: Colors.transparent,
                                    onPressed: () {
                                      print("place Fixer");
                                    },
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage: AssetImage(
                                      "assets/images/profile.png",
                                    ),
                                    radius: 90,
                                  ),
                                  IconButton(
                                    icon: Icon(FontAwesomeIcons.penToSquare),
                                    color: AdoptiniColors.mainColor,
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(context, AdoptiniRouter.editProfileScreen);
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                "${_user.name}",
                                style: GoogleFonts.leagueSpartan(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(FontAwesomeIcons.locationDot, color: AdoptiniColors.accentColor),
                                  Text(
                                    "${_user.city} ${_user.country}",
                                    style:
                                        GoogleFonts.leagueSpartan(fontSize: 20, color: AdoptiniColors.accentColor),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              ProfileButtonWidget(
                                title: LocaleKeys.my_pets.tr(),
                                icon: FontAwesomeIcons.cat,
                                ontap: () {
                                  Navigator.of(context).pushNamed(AdoptiniRouter.adoptionsScreen);
                                },
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              ProfileButtonWidget(
                                title: LocaleKeys.favorites.tr(),
                                icon: FontAwesomeIcons.heart,
                                ontap: () {
                                  Navigator.of(context).pushNamed(AdoptiniRouter.favoritesScreen);
                                },
                              ),
                              SizedBox(
                                height: 90.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacementNamed(
                                          context,
                                          AdoptiniRouter.homeScreen,
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AdoptiniColors.mainColor,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        height: 60,
                                        width: 60,
                                        child: Icon(
                                          FontAwesomeIcons.house,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        AdoptiniDialog(
                                          context,
                                          mainButton: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                                context.read<UserCubit>().logout();
                                                Navigator.of(context)
                                                    .pushReplacementNamed(AdoptiniRouter.loginScreen);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(15),
                                                    border: Border.all(color: Colors.white)),
                                                child: Text(
                                                  LocaleKeys.logout.tr(),
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
                                                Navigator.of(context)
                                                    .pushReplacementNamed(AdoptiniRouter.homeScreen);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(15),
                                                    border: Border.all(color: Colors.white)),
                                                child: Text(
                                                  LocaleKeys.cancel.tr(),
                                                  style: GoogleFonts.leagueSpartan(
                                                    fontSize: 15,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          title: LocaleKeys.logout.tr(),
                                          description: LocaleKeys.confirm_logout.tr(),
                                          header: const Icon(
                                            FontAwesomeIcons.doorOpen,
                                            color: Colors.white,
                                          ),
                                        ).show();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AdoptiniColors.mainColor,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        height: 60,
                                        width: 60,
                                        child: Icon(
                                          FontAwesomeIcons.doorOpen,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class ProfileButtonWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function ontap;
  const ProfileButtonWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 156, 155, 155),
              blurRadius: 3,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: GoogleFonts.leagueSpartan(
                    fontWeight: FontWeight.bold, fontSize: 20, color: AdoptiniColors.accentColor),
              ),
              SizedBox(
                width: 20.w,
              ),
              Icon(icon, color: AdoptiniColors.accentColor),
            ],
          ),
        ),
      ),
    );
  }
}
