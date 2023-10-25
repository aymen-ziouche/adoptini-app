import 'package:adoptini_app/common/theme/adoptini_colors.dart';
import 'package:adoptini_app/core/home/data/models/pet_model.dart';
import 'package:adoptini_app/core/home/presentation/widgets/background_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PetShareWidget extends StatefulWidget {
  final PetModel pet;

  const PetShareWidget({Key? key, required this.pet}) : super(key: key);

  @override
  State<PetShareWidget> createState() => _PetShareWidgetState();
}

class _PetShareWidgetState extends State<PetShareWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 600,
      color: AdoptiniColors.backgroundColors,
      child: Stack(
        children: [
          background(),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                Text(
                  "Adoptini",
                  style: GoogleFonts.lemon(
                    color: AdoptiniColors.mainColor,
                    fontSize: 31,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 16),
                Image.network(
                  widget.pet.image,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.pet.name,
                      style: GoogleFonts.lemonada(fontSize: 18, color: AdoptiniColors.accentColor),
                    ),
                    widget.pet.gender == "male"
                        ? const Icon(FontAwesomeIcons.mars, color: AdoptiniColors.accentColor)
                        : const Icon(FontAwesomeIcons.venus, color: AdoptiniColors.accentColor),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.pet.type,
                      style: GoogleFonts.lemonada(fontSize: 18, color: AdoptiniColors.accentColor),
                    ),
                    Text(
                      widget.pet.age,
                      style: GoogleFonts.lemonada(fontSize: 18, color: AdoptiniColors.accentColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
