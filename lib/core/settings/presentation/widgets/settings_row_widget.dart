import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class SettingsRowWidget extends StatelessWidget {
  final String title;
  final Color avatarColor;
  final Color iconColor;
  final String value;
  final IconData icon;
  final Function ontap;
  const SettingsRowWidget({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.ontap,
    required this.avatarColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: avatarColor.withOpacity(0.4),
              child: Icon(
                icon,
                color: iconColor,
                size: 40,
              ),
              radius: 30,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              title,
              style: GoogleFonts.leagueSpartan(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Row(
          children: [
            Text(value),
            SizedBox(
              width: 10.w,
            ),
            GestureDetector(
              onTap: () {
                ontap();
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
      ],
    );
  }
}
