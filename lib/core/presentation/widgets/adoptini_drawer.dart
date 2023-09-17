import 'package:adoptini_app/auth/presentation/cubit/user/user_cubit.dart';
import 'package:adoptini_app/common/adoptini_router.dart';
import 'package:adoptini_app/common/theme/adoptini_colors.dart';
import 'package:adoptini_app/core/presentation/widgets/drawer_list_item.dart';
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
              height: 50.h,
            ),
            Row(
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
                      _userCubit.user.name,
                      style: GoogleFonts.leagueSpartan(
                          color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      _userCubit.user.email,
                      style: GoogleFonts.leagueSpartan(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 50.h,
            ),
            DrawerListItem(icon: FontAwesomeIcons.cat, text: "Adoptions", onTap: () {}),
            DrawerListItem(icon: FontAwesomeIcons.plus, text: "Add Pet", onTap: () {}),
            DrawerListItem(icon: FontAwesomeIcons.heart, text: "Favorites", onTap: () {}),
            DrawerListItem(icon: FontAwesomeIcons.gear, text: "Settings", onTap: () {}),
            DrawerListItem(icon: FontAwesomeIcons.message, text: "Messages", onTap: () {}),
            DrawerListItem(
                icon: FontAwesomeIcons.doorOpen,
                text: "Logout",
                onTap: () {
                  context.read<UserCubit>().logout();
                  Navigator.of(context).pushNamed(AdoptiniRouter.login);
                }),
          ],
        ),
      ),
    );
  }
}
