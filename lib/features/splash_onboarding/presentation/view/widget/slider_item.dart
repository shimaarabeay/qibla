import 'package:flutter/material.dart';
import 'package:qibla/core/presentation/resources/color_manager.dart';
import 'package:qibla/features/splash_onboarding/domain/models/onboarding_model.dart';

class SliderItem extends StatelessWidget {
  final SliderObject slider; // SliderObject

  const SliderItem({super.key, required this.slider});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: screenHeight * 0.4,
          width: screenWidth * 0.95,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  slider.imageUrl,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),


              if (slider.overlayWidget != null) slider.overlayWidget!,
            ],
          ),
        ),
        SizedBox(height: screenHeight * 0.03),
        Text(
          slider.title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: screenHeight * 0.028,
              fontWeight: FontWeight.bold,
              color: ColorManager.primaryColor),
        ),
        SizedBox(height: screenHeight * 0.015),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            slider.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: screenHeight * 0.02,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
