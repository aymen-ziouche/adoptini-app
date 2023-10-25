import 'dart:async';

import 'package:adoptini_app/common/adoptini_router.dart';
import 'package:adoptini_app/common/enums.dart';
import 'package:adoptini_app/core/home/data/models/pet_model.dart';
import 'package:adoptini_app/core/home/presentation/cubit/messages_cubit/messages_cubit.dart';
import 'package:adoptini_app/core/home/presentation/cubit/pet_cubit/pet_cubit.dart';
import 'package:adoptini_app/core/home/presentation/widgets/adoptini_drawer.dart';
import 'package:adoptini_app/auth/presentation/cubit/user/user_cubit.dart';
import 'package:adoptini_app/common/theme/adoptini_colors.dart';
import 'package:adoptini_app/core/home/presentation/widgets/horizental_list_view_widget.dart';
import 'package:adoptini_app/core/home/presentation/widgets/vertical_list_view_widget.dart';
import 'package:adoptini_app/core/settings/presentation/cubit/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PetType selectedFilter = PetType.all;
  late SettingsCubit _settingsCubit;
  final _controller = StreamController<SwipeRefreshState>.broadcast();

  Stream<SwipeRefreshState> get _stream => _controller.stream;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  List<PetModel> localPets = [];
  List<PetModel> otherPets = [];
  late UserCubit _userCubit;
  @override
  void initState() {
    _userCubit = context.read<UserCubit>();
    _settingsCubit = context.read<SettingsCubit>();
    _settingsCubit.settings!.copyWith(firstUse: false);
    context.read<PetCubit>().fetchPets();
    super.initState();
  }

  @override
  void dispose() {
    _controller.close();

    super.dispose();
  }

  Future<void> _refreshData() async {
    _userCubit = context.read<UserCubit>();
    _settingsCubit = context.read<SettingsCubit>();
    _settingsCubit.settings!.copyWith(firstUse: false);
    await context.read<PetCubit>().fetchPets();

    setState(() {
      localPets = [];
      otherPets = [];
    });
    _controller.sink.add(SwipeRefreshState.hidden);
  }

  Widget buildAppBar() {
    int unreadCount = 0;

    return BlocConsumer<MessagesCubit, MessagesState>(listener: (context, state) {
      state.whenOrNull(
        messageLoaded: (messages) {
          for (var message in messages) {
            if (!message.isRead) {
              unreadCount++;
            }
          }
        },
      );
    }, builder: (context, state) {
      return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AdoptiniColors.mainColor,
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.bars),
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0).copyWith(right: 15),
            child: Row(
              children: [
                Container(
                  height: 60.h,
                  width: 40.w,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.solidBell,
                        size: 30,
                      ),
                      if (unreadCount > 0)
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            padding: EdgeInsets.all(3),
                            child: Text(
                              unreadCount.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AdoptiniRouter.messagesScreen);
                  },
                  child: Container(
                    height: 60.h,
                    width: 40.w,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.message,
                          size: 30,
                        ),
                        if (unreadCount > 0)
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              padding: EdgeInsets.all(3),
                              child: Text(
                                unreadCount.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(preferredSize: Size(double.infinity, 50.h), child: buildAppBar()),
        drawer: AdoptiniDrawer(userCubit: _userCubit),
        backgroundColor: AdoptiniColors.backgroundColors,
        body: BlocConsumer<PetCubit, PetState>(
          listener: (context, state) {
            state.whenOrNull(
              petloaded: (loadedPets) {
                localPets = loadedPets.where((pet) {
                  return pet.city == _userCubit.user!.city;
                }).toList();
                otherPets = loadedPets.where((pet) {
                  return pet.city != _userCubit.user!.city;
                }).toList();
              },
            );
          },
          builder: (context, state) {
            if (localPets.isNotEmpty || otherPets.isNotEmpty) {
              return SwipeRefresh.adaptive(
                stateStream: _stream,
                onRefresh: _refreshData,
                padding: const EdgeInsets.symmetric(vertical: 10),
                children: [
                  SingleChildScrollView(
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
                          height: 5.h,
                        ),
                        Text(
                          "Choose a pet type:",
                          style: GoogleFonts.lemon(color: const Color(0xff5E592D), fontSize: 14),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        SizedBox(
                          height: 40.h,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: List.generate(5, (index) {
                                List<PetType> type = [
                                  PetType.all,
                                  PetType.dog,
                                  PetType.cat,
                                  PetType.bird,
                                  PetType.other,
                                ];
                                return _buildFilterContainer(type[index]);
                              }),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Pets in ${_userCubit.user!.city}, ${_userCubit.user!.country} for Adoption !",
                          style: GoogleFonts.lemon(color: const Color(0xff5E592D), fontSize: 16),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        if (localPets.isNotEmpty &&
                            (selectedFilter == PetType.all ||
                                localPets.any((pet) => pet.type == selectedFilter.toString().split('.').last)))
                          SizedBox(
                            height: 260.h,
                            child: ListView.builder(
                              itemCount: localPets.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                PetModel pet = localPets[index];
                                if (selectedFilter != PetType.all &&
                                    pet.type != selectedFilter.toString().split('.').last) {
                                  return SizedBox.shrink();
                                }
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, AdoptiniRouter.petScreen, arguments: pet);
                                    },
                                    child: HorizentalListViewWidget(pet: pet),
                                  ),
                                );
                              },
                            ),
                          )
                        else
                          SizedBox(
                            height: 260.h,
                            child: Center(
                              child: Text(
                                "No matching Pets found",
                                style: GoogleFonts.lemon(
                                    color: const Color(0xff5E592D).withOpacity(0.5), fontSize: 14),
                              ),
                            ),
                          ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Other pets you may like !",
                          style: GoogleFonts.lemon(color: const Color(0xff5E592D), fontSize: 16),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        if (otherPets.isNotEmpty &&
                            (selectedFilter == PetType.all ||
                                otherPets.any((pet) => pet.type == selectedFilter.toString().split('.').last)))
                          MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: otherPets.length,
                              itemBuilder: (context, index) {
                                PetModel pet = otherPets[index];
                                if (selectedFilter != PetType.all &&
                                    pet.type != selectedFilter.toString().split('.').last) {
                                  return SizedBox.shrink();
                                }
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, AdoptiniRouter.petScreen, arguments: pet);
                                    },
                                    child: VerticalListViewWidget(pet: pet),
                                  ),
                                );
                              },
                            ),
                          )
                        else
                          SizedBox(
                            height: 200.h,
                            child: Center(
                              child: Text(
                                "No matching Pets found",
                                style: GoogleFonts.lemon(
                                    color: const Color(0xff5E592D).withOpacity(0.5), fontSize: 14),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return SwipeRefresh.adaptive(
                stateStream: _stream,
                onRefresh: _refreshData,
                children: [
                  Center(
                    child: Container(
                      color: AdoptiniColors.backgroundColors,
                      child: const Center(child: Text("Failed to load pets")),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildFilterContainer(PetType filter) {
    final isActive = selectedFilter == filter;
    final filterText = filter == PetType.all ? 'All' : filter.toString().split('.').last;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = filter;
        });
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
        decoration: BoxDecoration(
          color: isActive ? AdoptiniColors.mainColor : AdoptiniColors.mainColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            filterText,
            style: GoogleFonts.lemon(
              color: isActive ? Colors.white : Colors.black,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
