import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qibla/core/presentation/resources/color_manager.dart';
import 'package:qibla/core/presentation/resources/styles_manager.dart';

import '../../../../domain/entity/audio_entity.dart';
import '../../../manager/audio_cubit/audio_cubit.dart';
import '../../../manager/audio_cubit/audio_state.dart';


class UpNextItem extends StatelessWidget {
  final int index;
  final AudioEntity surah;

  const UpNextItem({
    super.key,
    required this.index,
    required this.surah,
  });

  @override
  Widget build(BuildContext context) {


    return BlocBuilder<AudioCubit, AudioState>(
      builder: (context, state) {
        final color = Theme.of(context);
        final cubit =  context.read<AudioCubit>();
        if (state is SurahPlayerState) {
          final isSelected = state.currentIndex == index;
          final isPlaying = state.isPlaying && isSelected;

          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: isSelected
                  ? ColorManager.orange.withOpacity(0.15)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: isSelected ? ColorManager.orange : ColorManager.gray,
                width: 0.8.w,
              ),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(10.r),

              /// 🔥 أهم تعديل هنا
              onTap: () {
                if (isSelected) {
                  /// نفس السورة
                  if (isPlaying) {
                    cubit.pause();
                  } else {
                    cubit.resume(); // 👈 يكمل
                  }
                } else {
                  /// سورة جديدة
                  cubit.changeSurah(index);
                  cubit.resume(); // 👈 مش play
                }
              },

              child: ListTile(
                dense: true,
                visualDensity: const VisualDensity(vertical: -4),
                minVerticalPadding: 0,
                contentPadding:
                EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),

                leading: CircleAvatar(
                  radius: 16.r,
                  backgroundColor:
                  isSelected ? ColorManager.orange : ColorManager.gray,
                  child: Text(
                    (index + 1).toString(),
                    style: TextStyle(
                      color: color.colorScheme.secondary,
                      fontSize: 12.sp,
                    ),
                  ),
                ),

                /// 📖 اسم السورة
                title: Text(
                  surah.name,
                  style: getBoldStyle(
                    color: isSelected
                        ? Colors.orange
                        : color.colorScheme.secondary,
                    fontSize: 14,
                  ),
                ),

                /// 👤 اسم القارئ
                subtitle: Text(
                  "Sheikh Mishary Rashid",
                  style: TextStyle(
                    color: ColorManager.gray,
                    fontSize: 11.sp,
                  ),
                ),

                /// ▶️ أيقونات التشغيل
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      color: ColorManager.orange,
                      size: 20.sp,
                    ),

                    SizedBox(width: 6.w),

                    if (isSelected)
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: Icon(
                          Icons.stop,
                          color: ColorManager.gray,
                          size: 18.sp,
                        ),
                        onPressed: () {
                          cubit.stop();
                        },
                      ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}