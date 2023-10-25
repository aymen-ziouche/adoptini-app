import 'package:adoptini_app/auth/presentation/cubit/user/user_cubit.dart';
import 'package:adoptini_app/common/adoptini_dialog.dart';
import 'package:adoptini_app/common/adoptini_router.dart';
import 'package:adoptini_app/common/theme/adoptini_colors.dart';
import 'package:adoptini_app/core/home/presentation/widgets/drawer_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AdoptiniDrawer extends StatelessWidget {
  const AdoptiniDrawer({
    super.key,
    required UserCubit userCubit,
  }) : _userCubit = userCubit;

  final UserCubit _userCubit;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AdoptiniColors.mainColor,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50.h,
            ),
            Text(
              "Adopt a Friend !",
              style: GoogleFonts.lemon(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(AdoptiniRouter.profileScreen);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(
                      "assets/images/profile.png",
                    ),
                    radius: 40,
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
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            DrawerListItem(
              icon: FontAwesomeIcons.locationDot,
              text: "Search Map",
              onTap: () {
                Navigator.of(context).pushNamed(AdoptiniRouter.mapScreen);
              },
            ),
            DrawerListItem(
                icon: FontAwesomeIcons.cat,
                text: "My Pets",
                onTap: () {
                  Navigator.of(context).pushNamed(AdoptiniRouter.adoptionsScreen);
                }),
            DrawerListItem(
                icon: FontAwesomeIcons.plus,
                text: "Add Pet",
                onTap: () {
                  Navigator.of(context).pushNamed(AdoptiniRouter.addPetScreen);
                }),
            DrawerListItem(
                icon: FontAwesomeIcons.heart,
                text: "Favorites",
                onTap: () {
                  Navigator.of(context).pushNamed(AdoptiniRouter.favoritesScreen);
                }),
            DrawerListItem(
                icon: FontAwesomeIcons.gear,
                text: "Settings",
                onTap: () {
                  Navigator.of(context).pushNamed(AdoptiniRouter.settingsScreen);
                }),
            // DrawerListItem(icon: FontAwesomeIcons.message, text: "Messages", onTap: () {}),
            DrawerListItem(
              icon: FontAwesomeIcons.doorOpen,
              text: "Logout",
              onTap: () {
                AdoptiniDialog(
                  context,
                  mainButton: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        context.read<UserCubit>().logout();
                        Navigator.of(context).pushReplacementNamed(AdoptiniRouter.loginScreen);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.white)),
                        child: Text(
                          "Logout",
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
                            borderRadius: BorderRadius.circular(15), border: Border.all(color: Colors.white)),
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
                  title: "Logout",
                  description: "Are you sure you want to Logout?",
                  header: const Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.white,
                  ),
                ).show();
              },
            ),
          ],
        ),
      ),
    );
  }
}
