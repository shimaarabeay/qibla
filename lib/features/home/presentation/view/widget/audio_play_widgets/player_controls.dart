import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/presentation/resources/color_manager.dart';
import '../../../manager/audio_cubit/audio_cubit.dart';
import '../../../manager/audio_cubit/audio_state.dart';


class PlayerControls extends StatelessWidget {
  const PlayerControls({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioCubit, AudioState>(
      builder: (context, state) {
        final cubit = context.read<AudioCubit>();
        final color = Theme.of(context);

        final isPlaying = (state is SurahPlayerState)
            ? state.isPlaying
            : false;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 20.w),
            IconButton(
              icon: Icon(
                Icons.skip_previous,
                color: color.colorScheme.secondary,
                size: 30.sp,
              ),
              onPressed: () => cubit.previousSurah(),
            ),

            const Spacer(),

            GestureDetector(
              onTap: () {
                if (isPlaying) {
                  cubit.pause();
                } else {
                  cubit.resume();
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
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  color: color.colorScheme.secondary,
                  size: 30.sp,
                ),
              ),
            ),

            const Spacer(),

            IconButton(
              icon: Icon(
                Icons.skip_next,
                color: color.colorScheme.secondary,
                size: 30.sp,
              ),
              onPressed: () => cubit.nextSurah(),
            ),

            SizedBox(width: 20.w),
          ],
        );
      },
    );
  }
}