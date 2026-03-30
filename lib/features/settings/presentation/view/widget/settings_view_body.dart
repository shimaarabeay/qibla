import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qibla/core/app/widgets/custom_button.dart';
import 'package:qibla/core/presentation/resources/color_manager.dart';
import 'package:qibla/core/presentation/resources/font_manager.dart';
import 'package:qibla/core/presentation/resources/routes_manager.dart';
import 'package:qibla/core/presentation/resources/styles_manager.dart';
import 'package:qibla/core/presentation/theme/manager/theme_cubit.dart';
import 'package:qibla/features/settings/presentation/view/widget/language_section.dart';
import 'package:qibla/features/settings/presentation/view/widget/option_item.dart';
import 'package:qibla/features/settings/presentation/view/widget/settings_option_section.dart';
import 'package:qibla/features/settings/presentation/view/widget/theme_section.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final color= Theme.of(context);
    return Container(
      color: color.scaffoldBackgroundColor,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 40.r),
              Center(
                child: CircleAvatar(
                  backgroundColor: ColorManager.orange.withOpacity(0.09),
                  radius: 40.r,
                  child: Icon(
                    Icons.accessibility,
                    size: FontSize.s40.sp,
                    color: ColorManager.orange,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Center(
                child: Text(
                  "إعدادات اللغة والمظهر",
                  style: getBoldMontserratStyle(
                      color: ColorManager.orange, fontSize: FontSize.s22.sp),
                ),
              ),
              Center(
                  child: Text(
                "خصص تجربتك مع القرآن الكريم",
                style: getRegularStyle(
                    color: ColorManager.black, fontSize: FontSize.s14.sp),
              )),
              SizedBox(height: 30.h),
              LanguageSection(),
              SizedBox(height: 30.h),
              ThemeSection(),
              const Spacer(),
              CustomButton(onPressed: () {}, text: 'تأكيد'),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: SizedBox(
                  height: 55.h,
                  width: double.infinity.w,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Routes.mainRoute);
                    },
                    child: Text(
                      "تخطى",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
