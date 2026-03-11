import 'package:flutter/material.dart';
import 'package:qibla/core/app/di.dart';
import 'package:qibla/features/home/presentation/view/home_view.dart';
import 'package:qibla/features/splash_onboarding/presentation/view/splash_view.dart';
import '../../../features/splash_onboarding/presentation/view/onboarding_view.dart';

class Routes {
  static const String splashRoute = "/splashRoute";
  static const String onboardingRoute = "/onboardingRoute";
  static const String homeRoute = "/homeRoute";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    PageRouteBuilder buildSlideRoute(Widget page) {
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;
          final tween = Tween<Offset>(begin: begin, end: end)
              .chain(CurveTween(curve: curve));

          final offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      );
    }

    switch (settings.name) {
      case Routes.splashRoute:
        return buildSlideRoute(const SplashView());

      case Routes.onboardingRoute:
        return buildSlideRoute(OnboardingView());

      case Routes.homeRoute:
        return buildSlideRoute(HomeView());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(child: Text('No Route Found')),
      ),
    );
  }

  static Route<dynamic> invalidArgumentsRoute(String? routeName) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text('Invalid route arguments: ${routeName ?? 'unknown'}'),
        ),
      ),
    );
  }
}
