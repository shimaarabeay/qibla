import 'package:flutter/material.dart';
import 'package:qibla/core/presentation/resources/color_manager.dart';
import 'package:qibla/core/presentation/resources/font_manager.dart';
import 'package:qibla/core/presentation/resources/styles_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: TextButton(
        style: TextButton.styleFrom(
          elevation: (0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
          backgroundColor: ColorManager.orange,
        ),
        onPressed: onPressed,
        child: Text(text,
            style: getBoldMontserratStyle(
              color: ColorManager.white,
              fontSize: FontSize.s20,
            )),
      ),
    );
  }
}
