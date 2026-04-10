import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qibla/core/presentation/resources/color_manager.dart';
import 'player_controls.dart';
import 'player_image.dart';
import 'progress_bar_widget.dart';
import 'surah_info.dart';
import 'up_next_list.dart';




class AudioPlayerBody extends StatelessWidget {
  const AudioPlayerBody({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context);
    return Scaffold(
      backgroundColor:color.colorScheme.background,
      body: SafeArea(
        child: Column(
         children: [
           Column(
             children: [
               SizedBox(height: 20.h,),
               PlayerImage(),
               SurahInfo(),
               ProgressBarWidget(),
               PlayerControls(),
               SizedBox(height: 10.h,),
                   Padding(
                     padding: EdgeInsets.symmetric(horizontal: 16.w),
                     child: Container(
            height: 30.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorManager.orange.withOpacity(0.18.sp),borderRadius: BorderRadius.all(Radius.circular(16))
            ),
            child: Center(
              child: Center(
                child: Text(
                  "View All",
                  style: TextStyle(color:  color.colorScheme.secondary),
                ),
              ),
            ),
                     ),
                   ),
             SizedBox(height: 10.h),
             ],
           ),

           Expanded(child: UpNextListView()),
         ],
                    ),
      ),
    );
  }
}
