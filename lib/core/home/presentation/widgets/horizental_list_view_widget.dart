import 'package:adoptini_app/common/theme/adoptini_colors.dart';
import 'package:adoptini_app/core/home/data/models/pet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';







class HorizentalListViewWidget extends StatelessWidget {
  const HorizentalListViewWidget({
    super.key,
    required this.pet,
  });

  final PetModel pet;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      width: 200.w,
      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          SizedBox(
            height: 200.h,
            width: 180.w,
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: pet.image,
                  fit: BoxFit.cover,
                  width: 180.w,
                  height: 200.h,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    pet.name,
                    style: GoogleFonts.lemonada(
                        fontSize: 18, color: AdoptiniColors.mainColor),
                  ),
                  pet.gender == "male"
                      ? const Icon(FontAwesomeIcons.mars)
                      : const Icon(FontAwesomeIcons.venus),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  const Icon(
                    FontAwesomeIcons.locationDot,
                    color: AdoptiniColors.mainColor,
                    size: 15,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "${pet.city}, ${pet.country}",
                    style: GoogleFonts.leagueSpartan(
                        fontSize: 15, color: AdoptiniColors.mainColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
