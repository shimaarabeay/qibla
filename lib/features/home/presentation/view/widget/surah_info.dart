import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qibla/core/presentation/resources/color_manager.dart';
import 'package:qibla/core/presentation/resources/font_manager.dart';
import 'package:qibla/core/presentation/resources/styles_manager.dart';

import '../../manager/cubit/surah_cubit.dart';
import '../../manager/cubit/surah_state.dart';

class SurahInfo extends StatelessWidget {
  const SurahInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context);

    return BlocBuilder<SurahCubit, SurahState>(
      builder: (context, state) {
        String surahName = "Loading...";
        String reciter = "Sheikh Mishary Rashid Alafasy";
        if (state is SurahPlayerState && state.surahs.isNotEmpty) {
          final currentSurah = state.surahs[state.currentIndex];
          surahName = currentSurah.name;
        }
        return Column(
          children: [
            SizedBox(height: 10.h,),
            Text(
              surahName,
              style: getBoldStyle(
                  color: ColorManager.orange, fontSize: FontSize.s16.sp),
            ),
            SizedBox(height: 6.h),
            Text(
              reciter,
              style: getBoldStyle(color: color.colorScheme.secondary, fontSize: FontSize.s16.sp),
            ),
          ],
        );
      },
    );
  }
}