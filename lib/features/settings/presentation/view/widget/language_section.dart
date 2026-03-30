import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qibla/core/presentation/theme/manager/theme_cubit.dart';
import 'package:qibla/features/settings/presentation/view/widget/option_item.dart';
import 'package:qibla/features/settings/presentation/view/widget/settings_option_section.dart';

class LanguageSection extends StatelessWidget {
  const LanguageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
  final selected = true  ;
    final color= Theme.of(context);
    return OptionSection(
      title: "اختر اللغة",
      options: [
        OptionItem(
          width: 160.w,
          title: "English",
          isSelected: selected,
          onTap: () {},
        ),
        Spacer(),
        OptionItem(
          width: 160.w,
          title: "العربية",
          isSelected: false,
          onTap: () {},
        ),
      ],
    );
  }
}
