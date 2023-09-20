import 'dart:io';
import 'package:adoptini_app/auth/presentation/cubit/user/user_cubit.dart';
import 'package:adoptini_app/auth/presentation/widgets/custom_input_field.dart';
import 'package:adoptini_app/common/adoptini_dialog.dart';
import 'package:adoptini_app/common/enums.dart';
import 'package:adoptini_app/common/theme/adoptini_colors.dart';
import 'package:adoptini_app/common/theme/login_theme.dart';
import 'package:adoptini_app/common/theme/main_button.dart';
import 'package:adoptini_app/core/addPet/presentation/cubit/addpet_cubit.dart';
import 'package:adoptini_app/core/addPet/presentation/widgets/image_selecting_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class AddPetForm extends StatefulWidget {
  const AddPetForm({super.key});

  @override
  State<AddPetForm> createState() => _AddPetFormState();
}

class _AddPetFormState extends State<AddPetForm> with TickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final AnimationController _animationController;
  final _nameFieldController = TextEditingController();
  final _ageFieldController = TextEditingController();
  late File _petImage;
  PetGender? _selectedGender;
  PetType? _selectedType;
  PetSize? _selectedSize;
  final _descriptionFieldController = TextEditingController();
  void _updatePetImage(File imageFile) {
    setState(() {
      _petImage = imageFile;
    });
  }

  String? _errorText;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 3000));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddpetCubit, AddpetState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
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
                      .copyWith(fontWeight: FontWeight.w600, color: Colors.blue, fontSize: 14.sp),
                ),
              ),
              title: "Adding Pet",
              description: "Please Wait...",
              header: const CircularProgressIndicator(),
            ).show();
          },
          loaded: () {
            Navigator.of(context).pop();
            _nameFieldController.clear();
            _ageFieldController.clear();
            _descriptionFieldController.clear();
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
                      .copyWith(fontWeight: FontWeight.w600, color: Colors.blue, fontSize: 14.sp),
                ),
              ),
              title: "Your Pet is Added",
              description: "Your pet is added and waiting for an adopter",
              header: const Icon(FontAwesomeIcons.check),
            ).show();
          },
          error: (errorMessage) {
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
                      .copyWith(fontWeight: FontWeight.w600, color: Colors.blue, fontSize: 14.sp),
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
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              "Add pets!",
                              style: GoogleFonts.lemon(
                                color: AdoptiniColors.mainColor,
                                fontSize: 38,
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 20,
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 2,
                                  )
                                ],
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  showImageSelectingDialog(context, _updatePetImage);
                                },
                                child: CircleAvatar(
                                    radius: 90,
                                    backgroundColor: AdoptiniColors.backgroundColors.withOpacity(0.9),
                                    child: Image.asset(
                                      "assets/images/paw.png",
                                      fit: BoxFit.contain,
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomFormInputField(
                              controller: _nameFieldController,
                              labelText: "Pet Name",
                              errorText: _errorText,
                              lines: 1,
                              numbers: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Name cannot be empty";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomFormInputField(
                              controller: _ageFieldController,
                              labelText: "Pet age",
                              errorText: _errorText,
                              lines: 1,
                              numbers: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "age cannot be empty";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Theme(
                              data: Theme.of(context).copyWith(
                                canvasColor: AdoptiniColors.formFillColor,
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                decoration: BoxDecoration(
                                  color: AdoptiniColors.formFillColor,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: DropdownButtonFormField<PetType>(
                                  style: const TextStyle(
                                    fontFamily: 'OpenSans',
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: 0,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "Type",
                                    labelStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    if (value == null) {
                                      return "Type cannot be empty";
                                    }
                                    return null;
                                  },
                                  value: _selectedType,
                                  items: PetType.values.map((type) {
                                    return DropdownMenuItem<PetType>(
                                      value: type,
                                      child: Container(
                                        constraints: const BoxConstraints(
                                          minHeight: 48.0,
                                        ),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          type.name,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedType = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Theme(
                              data: Theme.of(context).copyWith(
                                canvasColor: AdoptiniColors.formFillColor,
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                decoration: BoxDecoration(
                                  color: AdoptiniColors.formFillColor,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: DropdownButtonFormField<PetGender>(
                                  style: const TextStyle(
                                    fontFamily: 'OpenSans',
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: 0,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "Gender",
                                    labelStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    if (value == null) {
                                      return "Gender cannot be empty";
                                    }
                                    return null;
                                  },
                                  value: _selectedGender,
                                  items: PetGender.values.map((gender) {
                                    return DropdownMenuItem<PetGender>(
                                      value: gender,
                                      child: Container(
                                        constraints: const BoxConstraints(
                                          minHeight: 48.0,
                                        ),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          gender.name,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedGender = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Theme(
                              data: Theme.of(context).copyWith(
                                canvasColor: AdoptiniColors.formFillColor,
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                decoration: BoxDecoration(
                                  color: AdoptiniColors.formFillColor,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: DropdownButtonFormField<PetSize>(
                                  style: const TextStyle(
                                    fontFamily: 'OpenSans',
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: 0,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "Size",
                                    labelStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    if (value == null) {
                                      return "Size cannot be empty";
                                    }
                                    return null;
                                  },
                                  value: _selectedSize,
                                  items: PetSize.values.map((size) {
                                    return DropdownMenuItem<PetSize>(
                                      value: size,
                                      child: Container(
                                        constraints: const BoxConstraints(
                                          minHeight: 48.0,
                                        ),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          size.name,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedSize = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomFormInputField(
                              controller: _descriptionFieldController,
                              labelText: "Description",
                              errorText: _errorText,
                              lines: 5,
                              numbers: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Description cannot be empty";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            MainButton(
                              text: "Add Pet",
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  if (!currentFocus.hasPrimaryFocus && currentFocus.hasFocus) {
                                    FocusManager.instance.primaryFocus?.unfocus();
                                  }
                                  final ownerid = context.read<UserCubit>().user.uid;
                                  context.read<AddpetCubit>().addPet(
                                        _nameFieldController.text,
                                        _ageFieldController.text,
                                        _selectedGender.toString().split(".").last,
                                        _selectedSize.toString().split(".").last,
                                        _selectedType.toString().split(".").last,
                                        _petImage.path,
                                        _descriptionFieldController.text,
                                        ownerid,
                                      );
                                }
                              },
                            ),
                            SizedBox(
                              height: 10.h,
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
