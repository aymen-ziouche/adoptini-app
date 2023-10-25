import 'dart:io';

import 'package:adoptini_app/auth/presentation/cubit/user/user_cubit.dart';
import 'package:adoptini_app/common/adoptini_dialog.dart';
import 'package:adoptini_app/common/theme/adoptini_colors.dart';
import 'package:adoptini_app/common/theme/login_theme.dart';
import 'package:adoptini_app/common/theme/main_button.dart';
import 'package:adoptini_app/core/home/data/models/pet_model.dart';
import 'package:adoptini_app/core/home/presentation/cubit/messages_cubit/messages_cubit.dart';
import 'package:adoptini_app/core/home/presentation/cubit/pet_cubit/pet_cubit.dart';
import 'package:adoptini_app/core/home/presentation/widgets/background_widget.dart';
import 'package:adoptini_app/core/home/presentation/widgets/share_widget.dart';
import 'package:adoptini_app/core/home/presentation/widgets/vertical_list_view_widget.dart';
import 'package:adoptini_app/generated/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class PetScreen extends StatefulWidget {
  final PetModel pet;
  const PetScreen({super.key, required this.pet});

  @override
  State<PetScreen> createState() => _PetScreenState();
}

ScreenshotController screenshotController = ScreenshotController();

late PetCubit _petCubit;
late UserCubit _userCubit;
late MessagesCubit _messagesCubit;
bool isFavorite = false;
bool isUserTheowner = false;

class _PetScreenState extends State<PetScreen> {
  @override
  void initState() {
    _petCubit = context.read<PetCubit>();
    _userCubit = context.read<UserCubit>();
    _messagesCubit = context.read<MessagesCubit>();
    checkIfFavorite();
    checkIfTheUserIsTheOwner();
    super.initState();
  }

  void checkIfFavorite() async {
    PetModel currentPet = widget.pet;
    for (var pet in _petCubit.favoritePets) {
      if (pet.petId == currentPet.petId) {
        print("is favorite");
        setState(() {
          isFavorite = true;
        });
      } else {
        print("is not favorite");
      }
    }
  }

  void toggleFavoriteState() {
    final uid = context.read<UserCubit>().user!.uid;
    if (isFavorite) {
      _petCubit.removePetFromFavorites(widget.pet, uid);
    } else {
      _petCubit.addPetToFavorites(widget.pet, uid);
    }
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  void checkIfTheUserIsTheOwner() {
    final isOwner = _userCubit.user!.uid == widget.pet.owner.uid;
    setState(() {
      isUserTheowner = isOwner;
    });
  }

  void screenshotAndShareImage() {
    screenshotController
        .captureFromWidget(
      PetShareWidget(
        pet: widget.pet,
      ),
    )
        .then((capturedImage) async {
      final directory = await getApplicationDocumentsDirectory();
      final imagePath = '${directory.path}/${widget.pet.name}.png';
      final file = File(imagePath);
      await file.writeAsBytes(capturedImage);
      await Share.shareXFiles([XFile(file.path)]);
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = context.read<UserCubit>().user!;
    final id = context.read<UserCubit>().user!.id;
    print("id: " + id.toString());

    return Scaffold(
      backgroundColor: AdoptiniColors.backgroundColors,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AdoptiniColors.mainColor,
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.arrowLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: () async {
                screenshotAndShareImage();
              },
              icon: Icon(
                FontAwesomeIcons.arrowUpFromBracket,
                color: AdoptiniColors.mainColor,
              )),
          isUserTheowner
              ? IconButton(
                  onPressed: () async {
                    AdoptiniDialog(
                      context,
                      mainButton: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();

                            _petCubit.deletePet(widget.pet);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.white)),
                            child: Text(
                              LocaleKeys.delete_pet.tr(),
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
                      title: LocaleKeys.delete_pet.tr(),
                      description: LocaleKeys.delete_pet_confirm.tr(),
                      header: const Icon(
                        FontAwesomeIcons.trash,
                        color: Colors.white,
                      ),
                    ).show();
                  },
                  icon: Icon(
                    FontAwesomeIcons.trash,
                    color: AdoptiniColors.mainColor,
                  ))
              : SizedBox.shrink(),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
          child: BlocConsumer<MessagesCubit, MessagesState>(listener: (context, state) {
        state.whenOrNull(
          msgSending: () => AdoptiniDialog(context,
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
              title: LocaleKeys.sending_message.tr(),
              description: LocaleKeys.please_wait.tr(),
              header: CircularProgressIndicator(
                color: Colors.white,
              )).show(),
          msgSent: () {
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
              title: LocaleKeys.message_sent.tr(),
              description: LocaleKeys.message_sent_subtitle.tr(),
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
              description: "$errorMessage",
              header: const Icon(
                FontAwesomeIcons.x,
                color: Colors.white,
              ),
            ).show();
          },
        );
      }, builder: (context, state) {
        return AboutPet(
          pet: widget.pet,
        );
      })),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: MainButton(
                  text: LocaleKeys.adopt.tr(),
                  onTap: () {
                    _messagesCubit.sendMsgAboutPet(widget.pet, currentUser, "Hello ${widget.pet.name}");

                    print("Adopt pet");
                  }),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: toggleFavoriteState,
                child: Container(
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: AdoptiniColors.mainColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Icon(
                      isFavorite ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutPet extends StatelessWidget {
  final PetModel pet;
  const AboutPet({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.h,
            ),
            SizedBox(
              height: 360.h,
              child: Stack(
                children: [
                  background(),
                  Center(
                    child: Container(
                      height: 300.h,
                      width: 250.w,
                      decoration: ShapeDecoration(
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(width: 6, color: Color(0xFF48431B)),
                        ),
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              pet.image,
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        pet.name,
                        style: GoogleFonts.leagueSpartan(
                          color: AdoptiniColors.accentColor,
                          fontSize: 37,
                        ),
                      ),
                      pet.gender == "male"
                          ? const Icon(FontAwesomeIcons.mars, color: AdoptiniColors.accentColor)
                          : const Icon(FontAwesomeIcons.venus, color: AdoptiniColors.accentColor),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  const Divider(
                    color: AdoptiniColors.accentColor,
                    height: 10,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  InfoRow(label: LocaleKeys.age.tr(), value: pet.age),
                  InfoRow(label: LocaleKeys.petLocation.tr(), value: "${pet.city}, ${pet.country}"),
                  InfoRow(label: LocaleKeys.type.tr(), value: pet.type),
                  InfoRow(label: LocaleKeys.size.tr(), value: pet.size),
                  SizedBox(
                    height: 5.h,
                  ),
                  const Divider(
                    color: AdoptiniColors.accentColor,
                    height: 10,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    pet.description,
                    maxLines: 5,
                    style: GoogleFonts.leagueSpartan(
                      color: AdoptiniColors.accentColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ],
    );
  }
}
