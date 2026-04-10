import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../manager/audio_cubit/audio_cubit.dart';
import '../../../manager/audio_cubit/audio_state.dart';


class ProgressBarWidget extends StatelessWidget {
  const ProgressBarWidget({super.key});


  String formatTime(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');

    if (hours > 0) {
      return "$hours:$minutes:$seconds";
    } else {
      return "$minutes:$seconds";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioCubit,AudioState>(
      builder: (context, state) {
        final color = Theme.of(context);
        if (state is SurahPlayerState) {
          final position = state.currentPosition;
          final duration = state.duration;

          return Column(
            children: [
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 2,
                  thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                  overlayShape: const RoundSliderOverlayShape(overlayRadius: 12),
                ),
                child: Slider(
                  value: position.inSeconds.toDouble(),
                  max: duration.inSeconds.toDouble() == 0 ? 1 : duration.inSeconds.toDouble(),
                  onChanged: (value) {
                    context.read<AudioCubit>().seek(Duration(seconds: value.toInt()));
                  },
                  activeColor: Colors.orange,
                  inactiveColor: Colors.grey,
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  children: [
                    Text(
                      formatTime(position),
                      style: TextStyle(
                        color: color.colorScheme.secondary,
                        fontSize: 12.sp,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      formatTime(duration),
                      style: TextStyle(
                        color: color.colorScheme.secondary,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          // حالة قبل بدء التشغيل
          return Column(
            children: [
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 2,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6.r),
                ),
                child: const Slider(
                  value: 0,
                  max: 1,
                  onChanged: null,
                  activeColor: Colors.orange,
                  inactiveColor: Colors.grey,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  children: [
                    Text("00:00", style: TextStyle(color: color.primaryColor, fontSize: 12.sp)),
                    const Spacer(),
                    Text("00:00", style: TextStyle(color: color.primaryColor, fontSize: 12.sp)),
                  ],
                ),
              )
            ],
          );
        }
      },
    );
  }
}