import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.cardBackground,
  });

  final Color? cardBackground;

  @override
  CustomColors copyWith({Color? cardBackground}) {
    return CustomColors(
      cardBackground: cardBackground ?? this.cardBackground,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t),
    );
  }

  CustomColors harmonized(ColorScheme dynamic) {
    return copyWith(
        cardBackground: cardBackground!.harmonizeWith(dynamic.primary));
  }
}
