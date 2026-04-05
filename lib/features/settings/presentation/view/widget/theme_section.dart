import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qibla/core/presentation/theme/manager/theme_cubit.dart';
import 'package:qibla/features/settings/presentation/view/widget/option_item.dart';
import 'package:qibla/features/settings/presentation/view/widget/settings_option_section.dart';

class ThemeSection extends StatelessWidget {
  const ThemeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ThemeCubit>();

    return OptionSection(
      title: "المظهر",
      options: [
        OptionItem(
          title: "النظام",
          icon: Icons.settings,
          isSelected: cubit.isSelected(ThemeMode.system),
          onTap: () {
            cubit.updateTheme(ThemeMode.system);
          },
          width: 108.w,
        ),
        Spacer(),
        OptionItem(
          title: "داكن",
          icon: Icons.dark_mode,
          isSelected:  cubit.isSelected(ThemeMode.dark),
          onTap: () {
            cubit.updateTheme(ThemeMode.dark);
          },
          width: 108.w,
        ),
        Spacer(),
        OptionItem(
          title: "فاتح",
          icon: Icons.light_mode,
          isSelected: cubit.isSelected(ThemeMode.light),
          onTap: () {
            cubit.updateTheme(ThemeMode.light);
          },
          width: 108.w,
        ),
      ],
    );
  }
}
