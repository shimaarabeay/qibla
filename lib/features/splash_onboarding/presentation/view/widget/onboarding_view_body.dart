import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qibla/core/app/widgets/custom_button.dart';
import 'package:qibla/core/presentation/resources/assets_manager.dart';
import 'package:qibla/core/presentation/resources/color_manager.dart';
import 'package:qibla/core/presentation/resources/routes_manager.dart';
import 'package:qibla/core/presentation/resources/styles_manager.dart';
import 'package:qibla/core/presentation/resources/values_manager.dart';
import 'package:qibla/features/splash_onboarding/presentation/manager/on_boarding_cubit.dart';
import 'package:qibla/features/splash_onboarding/presentation/view/widget/dots_indicator.dart' show DotsIndicator;
import 'package:qibla/features/splash_onboarding/presentation/view/widget/slider_item.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToHome() {
      Navigator.pushReplacementNamed(context, Routes.homeRoute);
    }
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<OnBoardingCubit, OnBoardingState>(
          builder: (context, state) {
            final cubit = context.read<OnBoardingCubit>();
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.05),
                  Image.asset(ImageAssets.onboardingIcon,height: 40,width: 40,),
                  SizedBox(height: screenHeight * 0.02),
                  Text('القرآن الكريم', style: getNunitoStyle(
                    fontSize: 20,
                    color: ColorManager.brown,
                    fontWeight: FontWeight.bold,
                  )),SizedBox(height: screenHeight * 0.02),
                  Expanded(
                    child: PageView.builder(
                      reverse: true,
                      controller: cubit.pageController,
                      itemCount: cubit.sliderData.length,
                      onPageChanged: cubit.onPageChanged,
                      itemBuilder: (context, index) {
                        return SliderItem(slider: cubit.sliderData[index]);
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  DotsIndicator(
                    currentIndex: state.currentIndex,
                    count: cubit.sliderData.length,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                              onPressed: () {
                                if (state.isLastPage) {
                                  navigateToHome();
                                } else {
                                  cubit.goNext();
                                }
                              },
                              text: state.isLastPage ? "ابدأ" : "التالي "))),
                  TextButton(
                    onPressed: navigateToHome,
                    child: Text(
                      "تخطي",
                      style: getNunitoStyle(
                          color: ColorManager.cadetGrey,
                          fontSize: AppSize.s10),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
