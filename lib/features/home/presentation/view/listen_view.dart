import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qibla/features/home/presentation/view/widget/player_image.dart';

class ListenView extends StatelessWidget {
  const ListenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          PlayerImage()
        ],
      ),
    );
  }
}
