import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qibla/core/presentation/resources/color_manager.dart';
import 'package:qibla/core/presentation/resources/styles_manager.dart';
import '../../../domain/entity/surah_entity.dart';
import '../../manager/cubit/surah_cubit.dart';
import '../../manager/cubit/surah_state.dart';

class UpNextItem extends StatelessWidget {
  final int index;
  final SurahEntity surah;

  const UpNextItem({
    super.key,
    required this.index,
    required this.surah,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context);
    return BlocBuilder<SurahCubit, SurahState>(
      builder: (context, state) {
        if (state is SurahPlayerState) {
          final isSelected = state.currentIndex == index;
          final isPlaying = state.isPlaying && isSelected;

          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: isSelected
                  ? ColorManager.orange.withOpacity(0.15.sp)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: isSelected ? ColorManager.orange : ColorManager.gray,
                width: 0.8.w,
              ),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(10.r),
              onTap: () {
                final cubit = context.read<SurahCubit>();
                if (isPlaying) {
                  cubit.pause();
                } else {
                  cubit.changeSurah(index);
                  cubit.play();
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
                  isSelected ?ColorManager.orange :ColorManager.gray,
                  child: Text(
                    (index + 1).toString(),
                    style: TextStyle(
                      color:  color.colorScheme.secondary,
                      fontSize: 12.sp,
                    ),
                  ),
                ),

                title: Text(
                  surah.name,
                  style: getBoldStyle(
                    color: isSelected ? Colors.orange : color.colorScheme.secondary,
                    fontSize: 14,
                  ),
                ),

                subtitle: Text(
                  "Sheikh Mishary Rashid",
                  style: TextStyle(
                    color: ColorManager.gray,
                    fontSize: 11.sp,
                  ),
                ),

                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      color: ColorManager.orange,
                      size: 20,
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
                          context.read<SurahCubit>().stop();
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