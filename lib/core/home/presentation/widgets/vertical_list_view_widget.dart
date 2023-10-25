import 'package:adoptini_app/common/theme/adoptini_colors.dart';
import 'package:adoptini_app/core/home/data/models/pet_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class VerticalListViewWidget extends StatelessWidget {
  const VerticalListViewWidget({
    Key? key,
    required this.pet,
  }) : super(key: key);

  final PetModel pet;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 200.h,
        width: 300.w,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color(0xffDFD9A6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 200.h,
                width: 150.w,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: CachedNetworkImage(
                    imageUrl: pet.image,
                    fit: BoxFit.cover,
                    width: 150.w,
                    height: 150.h,
                    progressIndicatorBuilder: (context, url, downloadProgress) => SizedBox(
                      height: 50.h,
                      width: 50.w,
                      child: CircularProgressIndicator(
                          color: AdoptiniColors.mainColor, value: downloadProgress.progress),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              FittedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          pet.name,
                          style: GoogleFonts.lemonada(fontSize: 18, color: AdoptiniColors.accentColor),
                        ),
                      ],
                    ),
                    InfoRow(label: "Age:", value: pet.age),
                    InfoRow(label: "Size:", value: pet.size),
                    InfoRow(label: "City:", value: pet.city),
                    InfoRow(label: "Country:", value: pet.country),
                    InfoRow(label: "Type:", value: pet.type),
                  ],
                ),
              ),
              pet.gender == "male"
                  ? const Icon(FontAwesomeIcons.mars, color: AdoptiniColors.accentColor)
                  : const Icon(FontAwesomeIcons.venus, color: AdoptiniColors.accentColor),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const InfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Text(
            label,
            style: GoogleFonts.lemonada(fontSize: 18, color: AdoptiniColors.accentColor),
          ),
          SizedBox(width: 5.w),
          FittedBox(
            child: Text(
              value,
              style: GoogleFonts.lemonada(fontSize: 15, color: AdoptiniColors.accentColor),
              overflow: TextOverflow.clip,
            ),
          ),
        ],
      ),
    );
  }
}
