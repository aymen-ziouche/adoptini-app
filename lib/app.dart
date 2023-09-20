import 'package:adoptini_app/auth/domain/usecases/logout_usecase.dart';
import 'package:adoptini_app/auth/domain/usecases/register_usecase.dart';
import 'package:adoptini_app/auth/domain/usecases/start_app_usecase.dart';
import 'package:adoptini_app/auth/presentation/cubit/auth_cubit.dart';
import 'package:adoptini_app/auth/presentation/cubit/user/user_cubit.dart';
import 'package:adoptini_app/common/adoptini_router.dart';
import 'package:adoptini_app/common/config.dart';
import 'package:adoptini_app/core/home/domain/usecases/add_pet_usecase.dart';
import 'package:adoptini_app/core/home/domain/usecases/fetch_pet_usecase.dart';
import 'package:adoptini_app/core/home/presentation/cubit/pet_cubit.dart';
import 'package:adoptini_app/injectable.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'auth/domain/usecases/login_usecase.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  final navigatorKey = GlobalKey<NavigatorState>();
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    WidgetsBinding.instance.addObserver(this);
    // ShakeDetector.autoStart(
    //   minimumShakeCount: 2,
    //   shakeSlopTimeMS: 500,
    //   shakeCountResetTime: 3000,
    //   onPhoneShake: () {
    //     showFlexibleBottomSheet(
    //       bottomSheetColor: Colors.transparent,
    //       bottomSheetBorderRadius: const BorderRadius.only(
    //         topLeft: Radius.circular(20),
    //         topRight: Radius.circular(20),
    //       ),
    //       isExpand: true,
    //       minHeight: 0,
    //       initHeight: 0.4,
    //       maxHeight: 1,
    //       context: navigatorKey.currentContext!,
    //       builder: (context, scrollController, bottomSheetOffset) {
    //         return ReportProblemSheet(
    //           bottomSheetOffset: bottomSheetOffset,
    //           scrollController: scrollController,
    //         );
    //       },
    //       anchors: [0, 0.9, 1],
    //       isSafeArea: true,
    //     );
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(
            locator.get<LoginUsecase>(),
            locator.get<RegisterUsecase>(),
          ),
        ),
        BlocProvider<UserCubit>(
          create: (context) => UserCubit(
            locator.get<StartAppUsecase>(),
            locator.get<LogoutUseCase>(),
          ),
        ),
        BlocProvider<PetCubit>(
          create: (context) => PetCubit(
            locator.get<AddPetUsecase>(),
            locator.get<FetchPetUsecase>(),
          ),
        ),
      ],
      child: Builder(
        builder: (context) {
          return ScreenUtilInit(
            designSize: const Size(360, 640),
            builder: (BuildContext context, Widget? child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                navigatorObservers: [
                  FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
                ],
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                theme: appTheme.lightTheme,
                // darkTheme: appTheme.darkTheme,
                themeMode: appTheme.currentTheme(),
                initialRoute: AdoptiniRouter.splash,
                onGenerateRoute: AdoptiniRouter.onGenerateRoute,
                navigatorKey: navigatorKey,
              );
            },
          );
        },
      ),
    );
  }
}
