import 'dart:io';
import 'package:adoptini_app/auth/presentation/cubit/user/user_cubit.dart';
import 'package:adoptini_app/auth/presentation/widgets/custom_input_field.dart';
import 'package:adoptini_app/common/adoptini_dialog.dart';
import 'package:adoptini_app/common/enums.dart';
import 'package:adoptini_app/common/theme/adoptini_colors.dart';
import 'package:adoptini_app/common/theme/login_theme.dart';
import 'package:adoptini_app/common/theme/main_button.dart';
import 'package:adoptini_app/core/home/presentation/cubit/pet_cubit/pet_cubit.dart';
import 'package:adoptini_app/core/home/presentation/widgets/image_selecting_dialog.dart';
import 'package:adoptini_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
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

enum AddPetType {
  cat,
  dog,
  bird,
  other;

  String tr() {
    switch (this) {
      case AddPetType.cat:
        return LocaleKeys.cat.tr();
      case AddPetType.dog:
        return LocaleKeys.dog.tr();
      case AddPetType.bird:
        return LocaleKeys.bird.tr();
      case AddPetType.other:
        return LocaleKeys.otherPets.tr();

      default:
        return 'Unknown';
    }
  }
}

class _AddPetFormState extends State<AddPetForm> with TickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final AnimationController _animationController;
  final _nameFieldController = TextEditingController();
  final _ageFieldController = TextEditingController();
  late File _petImage;
  bool _imageSelected = false;
  PetGender? _selectedGender;
  AddPetType? _selectedType;
  PetSize? _selectedSize;
  final _descriptionFieldController = TextEditingController();
  void _updatePetImage(File imageFile) {
    setState(() {
      _petImage = imageFile;
      _imageSelected = true;
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
    return BlocConsumer<PetCubit, PetState>(
      listener: (context, state) {
        state.whenOrNull(
          addPetloading: () {
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
                    LocaleKeys.close.tr(),
                    style: AppTheme.bodyTextSmall
                        .copyWith(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 14.sp),
                  ),
                ),
                title: LocaleKeys.adding_pet.tr(),
                description: LocaleKeys.please_wait.tr(),
                header: CircularProgressIndicator(
                  color: Colors.white,
                )).show();
          },
          addPetloaded: () {
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
                  LocaleKeys.close.tr(),
                  style: AppTheme.bodyTextSmall
                      .copyWith(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 14.sp),
                ),
              ),
              title: LocaleKeys.pet_added.tr(),
              description: LocaleKeys.pet_added_subtitle.tr(),
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
                  LocaleKeys.close.tr(),
                  style: AppTheme.bodyTextSmall
                      .copyWith(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 14.sp),
                ),
              ),
              title: LocaleKeys.error.tr(),
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
                              "${LocaleKeys.add_pet.tr()}!",
                              textAlign: TextAlign.center,
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
                                child: Container(
                                  height: 150.h,
                                  width: 150.w,
                                  decoration: ShapeDecoration(
                                    shape: CircleBorder(),
                                    image: _imageSelected
                                        ? DecorationImage(
                                            image: FileImage(
                                              File(
                                                _petImage.path,
                                              ),
                                            ),
                                            fit: BoxFit.cover,
                                          )
                                        : DecorationImage(
                                            image: AssetImage("assets/images/paw.png"),
                                            fit: BoxFit.contain,
                                          ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomFormInputField(
                              controller: _nameFieldController,
                              labelText: LocaleKeys.pet_name.tr(),
                              errorText: _errorText,
                              lines: 1,
                              numbers: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return LocaleKeys.pet_name_validator.tr();
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomFormInputField(
                              controller: _ageFieldController,
                              labelText: LocaleKeys.pet_age.tr(),
                              errorText: _errorText,
                              lines: 1,
                              numbers: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return LocaleKeys.pet_age_validator.tr();
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
                                child: DropdownButtonFormField<AddPetType>(
                                  style: const TextStyle(
                                    fontFamily: 'OpenSans',
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: 0,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: LocaleKeys.type.tr(),
                                    labelStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    if (value == null) {
                                      return LocaleKeys.pet_type_validator.tr();
                                    }
                                    return null;
                                  },
                                  value: _selectedType,
                                  items: AddPetType.values.map((type) {
                                    return DropdownMenuItem<AddPetType>(
                                      value: type,
                                      child: Container(
                                        constraints: const BoxConstraints(
                                          minHeight: 48.0,
                                        ),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          type.name.tr(),
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
                                    labelText: LocaleKeys.pet_gender.tr(),
                                    labelStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    if (value == null) {
                                      return LocaleKeys.pet_gender_validator.tr();
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
                                          gender.name.tr(),
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
                                    labelText: LocaleKeys.pet_size.tr(),
                                    labelStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    if (value == null) {
                                      return LocaleKeys.pet_size_validator.tr();
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
                                          size.name.tr(),
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
                              labelText: LocaleKeys.pet_description.tr(),
                              errorText: _errorText,
                              lines: 5,
                              numbers: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return LocaleKeys.pet_description_validator.tr();
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            MainButton(
                              text: LocaleKeys.add_pet.tr(),
                              onTap: () async {
                                if (_formKey.currentState!.validate() && _imageSelected) {
                                  if (!currentFocus.hasPrimaryFocus && currentFocus.hasFocus) {
                                    FocusManager.instance.primaryFocus?.unfocus();
                                  }
                                  final owner = context.read<UserCubit>().user;
                                  context.read<PetCubit>().addPet(
                                        _nameFieldController.text,
                                        _ageFieldController.text,
                                        _selectedGender.toString().split(".").last,
                                        _selectedSize.toString().split(".").last,
                                        _selectedType.toString().split(".").last,
                                        _petImage.path,
                                        _descriptionFieldController.text,
                                        owner!,
                                      );
                                } else if (!_imageSelected) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        LocaleKeys.please_select_image.tr(),
                                      ),
                                    ),
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
