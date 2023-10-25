import 'package:adoptini_app/common/enums.dart';
import 'package:adoptini_app/common/theme/adoptini_colors.dart';
import 'package:adoptini_app/core/settings/presentation/cubit/settings_cubit/settings_cubit.dart';
import 'package:adoptini_app/generated/locale_keys.g.dart';
import 'package:adoptini_app/utils/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguagesPopDialog {
  static Future<Languages?> show(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          contentPadding: const EdgeInsets.only(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          content: Container(
            color: AdoptiniColors.mainColor,
            width: 0.8.sw,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  LocaleKeys.languages.tr(),
                  style: GoogleFonts.leagueSpartan(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.h,
                ),
                const _LanguagesRadioButtons(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _LanguagesRadioButtons extends StatefulWidget {
  const _LanguagesRadioButtons({
    Key? key,
  }) : super(key: key);

  @override
  State<_LanguagesRadioButtons> createState() => _LanguagesRadioButtonsState();
}

class _LanguagesRadioButtonsState extends State<_LanguagesRadioButtons> {
  final List<Languages> appLanguages = Languages.values;
  late SettingsCubit _settingsCubit;
  late Languages? currentLanguage;

  @override
  void initState() {
    super.initState();
    _settingsCubit = context.read<SettingsCubit>();
    currentLanguage = _settingsCubit.settings!.appLanguage;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(),
      child: Column(
        children: [
          for (Languages language in appLanguages)
            RadioListTile<Languages>(
              activeColor: Colors.white,
              title: Text(
                language.toString().split(".").last.capitalize().tr(),
                style: GoogleFonts.leagueSpartan(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                // style: DevelStyles.dialogTitleText16.copyWith(fontSize: 16),
              ),
              value: language,
              groupValue: currentLanguage,
              onChanged: (value) {
                setState(() {
                  currentLanguage = value;
                });
              },
            ),
          SizedBox(
            height: 10.h,
          ),
          const Divider(
            color: Color(0xffededed),
            thickness: 2.0,
          ),
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(
                Colors.blueGrey,
              ),
            ).merge(
              TextButton.styleFrom(
                foregroundColor: Colors.black87,
                fixedSize: Size(double.infinity, 40.h),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2.r)),
                ),
              ),
            ),
            onPressed: () {
              Navigator.pop(context, currentLanguage);
            },
            child: Text(
              LocaleKeys.save.tr(),
              style: GoogleFonts.leagueSpartan(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
