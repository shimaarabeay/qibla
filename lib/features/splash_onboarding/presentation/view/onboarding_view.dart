import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qibla/features/splash_onboarding/presentation/manager/on_boarding_cubit.dart';
import 'package:qibla/features/splash_onboarding/presentation/view/widget/onboarding_view_body.dart';
import '../../../../core/app/app_prefs.dart';
import '../../../../core/app/di.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  void initState() {
    super.initState();
    setOnBoardingViewed();
    initAppModule();
  }

  void setOnBoardingViewed() {
    final AppPreferences appPreferences = instance<AppPreferences>();
    appPreferences.setOnBoardingViewed(true);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => instance<OnBoardingCubit>(),
      child: OnboardingViewBody(),
    );
  }
}
