import 'package:adoptini_app/auth/presentation/cubit/user/user_cubit.dart';
import 'package:adoptini_app/common/adoptini_router.dart';
import 'package:adoptini_app/common/loading_screen.dart';
import 'package:adoptini_app/common/theme/adoptini_colors.dart';
import 'package:adoptini_app/core/home/data/models/pet_model.dart';
import 'package:adoptini_app/core/home/presentation/cubit/pet_cubit/pet_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> with TickerProviderStateMixin {
  late UserCubit _userCubit;
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 3000));
    _userCubit = context.read<UserCubit>();
    context.read<PetCubit>().fetchFavorites(_userCubit.user!.uid);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      ),
      extendBodyBehindAppBar: true,
      body: BlocConsumer<PetCubit, PetState>(
        listener: (context, state) {
          state.whenOrNull(
            favoritesloaded: (favoritePets) {
              setState(() {
                favoritePets = favoritePets;
                print("fetched favorites: " + favoritePets.length.toString());
              });
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(favoritesloaded: (favoritePets) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 60.h,
                  ),
                  Text(
                    "Favorites!",
                    style: GoogleFonts.lemon(
                      color: AdoptiniColors.mainColor,
                      fontSize: 38,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  favoritePets.isNotEmpty
                      ? MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 0.6,
                            ),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: favoritePets.length,
                            itemBuilder: (context, index) {
                              PetModel pet = favoritePets[index];
                              print("pet: ${pet.name}");
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, AdoptiniRouter.petScreen, arguments: pet);
                                    },
                                    child: GridViewListWidget(pet: pet)),
                              );
                            },
                          ),
                        )
                      : Center(
                          child: Text(
                            "You dont have any favorite Pets",
                            style:
                                GoogleFonts.lemon(color: const Color(0xff5E592D).withOpacity(0.5), fontSize: 14),
                          ),
                        )
                ],
              ),
            );
          }, petloading: () {
            return const LoadingScreen();
          }, orElse: () {
            return Container(
              color: AdoptiniColors.backgroundColors,
              child: const Center(child: Text("Failed to load favorites")),
            );
          });
        },
      ),
    );
  }
}

class GridViewListWidget extends StatefulWidget {
  final PetModel pet;
  const GridViewListWidget({super.key, required this.pet});

  @override
  State<GridViewListWidget> createState() => _GridViewListWidgetState();
}

class _GridViewListWidgetState extends State<GridViewListWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100.h,
            width: 100.w,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: CachedNetworkImage(
                imageUrl: widget.pet.image,
                fit: BoxFit.cover,
                width: 150.w,
                height: 150.h,
                progressIndicatorBuilder: (context, url, downloadProgress) => SizedBox(
                  height: 50.h,
                  width: 50.w,
                  child:
                      CircularProgressIndicator(color: AdoptiniColors.mainColor, value: downloadProgress.progress),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          FittedBox(
            child: Row(
              children: [
                const Icon(
                  FontAwesomeIcons.locationDot,
                  color: AdoptiniColors.accentColor,
                  size: 18,
                ),
                Text(
                  "${widget.pet.city}, ${widget.pet.country}",
                  style: GoogleFonts.lemonada(fontSize: 18, color: AdoptiniColors.accentColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
