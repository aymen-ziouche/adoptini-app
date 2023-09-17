import 'package:package_info_plus/package_info_plus.dart';

class PackageInfoWrapper {
  PackageInfoWrapper._();

  static final PackageInfoWrapper _instance = PackageInfoWrapper._();

  static PackageInfoWrapper get instance {
    return _instance;
  }

  PackageInfo? _packageInfo;

  Future<PackageInfo> init() async {
    return _packageInfo ??= await PackageInfo.fromPlatform();
  }

  String get appName {
    if (_packageInfo == null) {
      throw Exception('PackageInfoWrapper not initialized');
    }
    return _packageInfo!.appName;
  }

  String get packageName {
    if (_packageInfo == null) {
      throw Exception('PackageInfoWrapper not initialized');
    }
    return _packageInfo!.packageName;
  }

  String get version {
    if (_packageInfo == null) {
      throw Exception('PackageInfoWrapper not initialized');
    }
    return _packageInfo!.version;
  }

  String get buildNumber {
    if (_packageInfo == null) {
      throw Exception('PackageInfoWrapper not initialized');
    }
    return _packageInfo!.buildNumber;
  }
}
