import 'package:adoptini_app/core/home/data/models/pet_model.dart';
import 'package:adoptini_app/core/home/presentation/cubit/pet_cubit.dart';
import 'package:adoptini_app/core/home/presentation/widgets/adoptini_drawer.dart';
import 'package:adoptini_app/auth/presentation/cubit/user/user_cubit.dart';
import 'package:adoptini_app/common/theme/adoptini_colors.dart';
import 'package:adoptini_app/core/home/presentation/widgets/horizental_list_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  List<PetModel> pets = [];
  late UserCubit _userCubit;
  @override
  void initState() {
    _userCubit = context.read<UserCubit>();
    context.read<PetCubit>().fetchPets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: AdoptiniColors.mainColor,
          leading: IconButton(
            icon: const Icon(FontAwesomeIcons.bars),
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),
        drawer: AdoptiniDrawer(userCubit: _userCubit),
        backgroundColor: AdoptiniColors.backgroundColors,
        body: BlocConsumer<PetCubit, PetState>(
          listener: (context, state) {
            state.whenOrNull(
              petloaded: (loadedPets) {
                print(" pets length => ${pets.length}");
                pets = loadedPets;
              },
            );
          },
          builder: (context, state) {
            if (pets.isNotEmpty) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          "assets/images/homeBackground.png",
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 50),
                          alignment: Alignment.center,
                          child: Text(
                            "Adoptini",
                            style: GoogleFonts.lemon(
                              color: AdoptiniColors.mainColor,
                              fontSize: 31,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      height: 280.h,
                      child: ListView.builder(
                        itemCount: pets.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          PetModel pet = pets[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: HorizentalListViewWidget(pet: pet),
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Container(
                color: AdoptiniColors.backgroundColors,
                child: const Center(child: Text("Failed to load pets")),
              );
            }
          },
        ),
      ),
    );
  }
}