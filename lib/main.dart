import 'package:adoptini_app/app.dart';
import 'package:adoptini_app/injectable.dart';
import 'package:adoptini_app/locator.dart';
import 'package:adoptini_app/utils/package_info_wrapper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async {
  // Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  await configInjections();
  await Geolocator.requestPermission();
  await MobileAds.instance.initialize();
  await dotenv.load(fileName: ".env");

  setupLocator();
  await PackageInfoWrapper.instance.init();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  SentryFlutter.init(
    (options) {
      options.dsn = 'https://af4c188afe625de5df5f0ef2ddb6bf35@o4505891090726912.ingest.sentry.io/4505891092299776';
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(
      EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('fr'),
          Locale('ar'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: const App(),
      ),
    ),
  );
}
