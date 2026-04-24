import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:qibla/features/settings/presentation/view/widget/option_item.dart';
import 'package:qibla/features/settings/presentation/view/widget/settings_option_section.dart';

class LanguageSection extends StatelessWidget {
  const LanguageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.locale;

    return OptionSection(
      title: "settings.language".tr(),
      options: [
        OptionItem(
          width: 160.w,
          title: "settings.english".tr(),
          isSelected: currentLocale.languageCode == 'en',
          onTap: () {
            context.setLocale(const Locale('en'));
          },
        ),

        const Spacer(),

        OptionItem(
          width: 160.w,
          title: "settings.arabic".tr(),
          isSelected: currentLocale.languageCode == 'ar',
          onTap: () {
            context.setLocale(const Locale('ar'));
          },
        ),
      ],
    );
  }
}