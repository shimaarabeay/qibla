import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qibla/core/app/widgets/custom_button.dart';
import 'package:qibla/core/presentation/resources/assets_manager.dart';
import 'package:qibla/core/presentation/resources/color_manager.dart';
import 'package:qibla/core/presentation/resources/routes_manager.dart';
import 'package:qibla/core/presentation/resources/styles_manager.dart';
import 'package:qibla/features/splash_onboarding/presentation/manager/on_boarding_cubit.dart';
import 'package:qibla/features/splash_onboarding/presentation/view/widget/dots_indicator.dart'
    show DotsIndicator;
import 'package:qibla/features/splash_onboarding/presentation/view/widget/slider_item.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<OnBoardingCubit, OnBoardingState>(
          builder: (context, state) {
            final cubit = context.read<OnBoardingCubit>();
            return Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  Image.asset(
                    ImageAssets.onboardingIcon,
                    height: 60.h,
                    width: 60.w,
                  ),
                  SizedBox(height: 10.h),
                  Text('app.quran'.tr(),
                      style: getNunitoStyle(
                        fontSize: 20.sp,
                        color: ColorManager.orange,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 10.h),
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
                  SizedBox(height: 15.h),
                  DotsIndicator(
                    currentIndex: state.currentIndex,
                    count: cubit.sliderData.length,
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                              onPressed: () {
                                if (state.isLastPage) {
                                  navigateToSettings(context);
                                } else {
                                  cubit.goNext();
                                }
                              },
                              text: state.isLastPage ? "onboarding.start".tr() : "onboarding.next".tr()))),
                  Center(
                    child: SizedBox(
                      height: 45.h,
                      width: double.infinity.w,
                      child: ElevatedButton(
                          onPressed: () => navigateToSettings(context),
                          child: Text("onboarding.skip".tr())),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void navigateToSettings(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.settingsRoute);
  }
}
