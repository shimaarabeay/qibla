import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qibla/core/presentation/resources/color_manager.dart';
import 'package:qibla/core/presentation/resources/styles_manager.dart';

class OptionSection extends StatelessWidget {
  final String title;
  final List <Widget>options;

  const OptionSection({
    super.key,
    required this.title,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(title, style: getBoldStyle(color: ColorManager.orange,fontSize: 18.sp)),
        const SizedBox(height: 10),
        Row(
          children:options

        ),
      ],
    );
  }
}
