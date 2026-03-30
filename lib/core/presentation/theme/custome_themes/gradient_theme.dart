import 'package:flutter/material.dart';

class AppGradientTheme extends ThemeExtension<AppGradientTheme> {
  final Gradient newBackground;

  const AppGradientTheme({
    required this.newBackground,
  });

  @override
  AppGradientTheme copyWith({
    Gradient? loginBackground,
  }) {
    return AppGradientTheme(
      newBackground: loginBackground ?? this.newBackground,
    );
  }

  @override
  AppGradientTheme lerp(ThemeExtension<AppGradientTheme>? other, double t) {
    if (other is! AppGradientTheme) return this;

    return AppGradientTheme(
      newBackground:
      Gradient.lerp(newBackground, other.newBackground, t)!,
    );
  }
}
