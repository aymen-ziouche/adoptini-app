import 'package:adoptini_app/common/theme/adoptini_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MyAdWidget extends StatefulWidget {
  const MyAdWidget({super.key});

  @override
  State<MyAdWidget> createState() => _MyAdWidgetState();
}

class _MyAdWidgetState extends State<MyAdWidget> {
  bool isNativeLoaded = false;
  late NativeAd nativeAd;
  @override
  void initState() {
    super.initState();
    _createAd();
  }

  @override
  void dispose() {
    nativeAd.dispose();
    super.dispose();
  }

  Future<void> _createAd() async {
    nativeAd = NativeAd(
        // adUnitId: "ca-app-pub-3940256099942544/2247696110",
        // TODO: uncomment this
        adUnitId: "ca-app-pub-4634134998951888/6016667210",
        listener: NativeAdListener(
          onAdLoaded: (ad) {
            setState(() {
              isNativeLoaded = true;
            });
          },
          onAdFailedToLoad: (ad, error) {
            setState(() {
              isNativeLoaded = false;
              nativeAd.dispose();
              print(error.message);
            });
          },
        ),
        factoryId: null,
        nativeTemplateStyle: NativeTemplateStyle(
            templateType: TemplateType.small, cornerRadius: 50.0, mainBackgroundColor: AdoptiniColors.mainColor),
        request: AdManagerAdRequest());
    await nativeAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return isNativeLoaded
        ? SizedBox(height: 80.h, width: 300.w, child: AdWidget(ad: nativeAd))
        : SizedBox.shrink();
  }
}
