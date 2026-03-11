import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:qibla/features/splash_onboarding/domain/models/onboarding_model.dart';

import '../../../../core/presentation/resources/assets_manager.dart';
import '../../../../generated/locale_keys.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(const OnBoardingState());
  final PageController pageController = PageController();

  final List<SliderObject> sliderData = [
    SliderObject(
        title: LocaleKeys.onBoardingTitle1.tr(),
        description: LocaleKeys.onBoardingDescription1.tr(),
        imageUrl: ImageAssets.onboard1,
        name: ''),
    SliderObject(
      title: LocaleKeys.onBoardingTitle2.tr(),
      description: LocaleKeys.onBoardingDescription2.tr(),
      imageUrl: ImageAssets.onboard2,
      name: '',
      overlayWidget: Positioned(
        bottom: -25,
        left: 0,
        right: 0,
        child: Center(
          child: Image.asset(
            ImageAssets.onboardLogo2,
          ),
        ),
      ),
    ),
    SliderObject(
      title: LocaleKeys.onBoardingTitle3.tr(),
      description: LocaleKeys.onBoardingDescription3.tr(),
      imageUrl: ImageAssets.onboard3,
      name: LocaleKeys.name.tr(),
    ),
  ];

  void goNext() {
    final nextIndex = state.currentIndex + 1;

    if (nextIndex < sliderData.length) {
      pageController.animateToPage(
        nextIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );

      emit(
        state.copyWith(
          currentIndex: nextIndex,
          status: OnBoardingStatus.next,
          isLastPage: nextIndex == sliderData.length - 1,
        ),
      );
    }
  }

  void onPageChanged(int index) {
    emit(
      state.copyWith(
        currentIndex: index,
        status: OnBoardingStatus.next,
        isLastPage: index == sliderData.length - 1,
      ),
    );
  }

  @override
  Future<void> close() {
    pageController.dispose();
    sliderData.clear();
    return super.close();
  }
}
