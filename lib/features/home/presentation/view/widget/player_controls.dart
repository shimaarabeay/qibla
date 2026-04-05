import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/presentation/resources/color_manager.dart';
import '../../manager/cubit/surah_cubit.dart';
import '../../manager/cubit/surah_state.dart';

class PlayerControls extends StatelessWidget {
  const PlayerControls({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SurahCubit>();
    final color = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 20.w,),
        IconButton(
          icon: Icon(Icons.skip_previous,
              color: color.colorScheme.secondary, size: 30),
          onPressed: () => cubit.previousSurah(),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            final isPlaying = (cubit.state is SurahPlayerState)
                ? (cubit.state as SurahPlayerState).isPlaying
                : false;

            if (isPlaying) {
              cubit.pause();
            } else {
              cubit.play();
            }
          },
          child: Container(
            height: 50.h,
            width: 50.w,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorManager.orange,
            ),
            child: Icon(
              (cubit.state is SurahPlayerState) &&
                      (cubit.state as SurahPlayerState).isPlaying
                  ? Icons.pause
                  : Icons.play_arrow,
              color: color.colorScheme.secondary,
              size: 30.sp,
            ),
          ),
        ),
        Spacer(),
        IconButton(
          icon: Icon(Icons.skip_next,
              color: color.colorScheme.secondary, size: 30.sp),
          onPressed: () => cubit.nextSurah(),
        ),
        SizedBox(width: 20.w,),
      ],
    );
  }
}
