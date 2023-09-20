import 'dart:io';
import 'dart:ui';

import 'package:adoptini_app/common/theme/adoptini_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';


void showImageSelectingDialog(BuildContext context, Function(File) updateImageCallback) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Center(
        child: Dialog(
          backgroundColor: AdoptiniColors.backgroundColors.withOpacity(0),
          elevation: 0,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              decoration: BoxDecoration(
                color: AdoptiniColors.mainColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 25.h,
                    ),
                    Center(
                      child: Text(
                        "Choose an Image !",
                        style: GoogleFonts.lemon(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final pickedFile = await ImagePicker().pickImage(
                              source: ImageSource.camera,
                            );
                            if (pickedFile != null) {
                              updateImageCallback(File(pickedFile.path));
                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "No image selected",
                                  ),
                                ),
                              );
                            }
                          },
                          child: const Icon(
                            Icons.camera_alt,
                            size: 80,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 50.w,
                        ),
                        GestureDetector(
                          onTap: () async {
                            final pickedFile = await ImagePicker().pickImage(
                              source: ImageSource.gallery,
                            );
                            if (pickedFile != null) {
                              updateImageCallback(File(pickedFile.path));
                              print(pickedFile.path);
                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "No image selected",
                                  ),
                                ),
                              );
                            }
                          },
                          child: const Icon(
                            Icons.photo,
                            size: 80,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
