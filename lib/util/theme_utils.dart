import 'package:flutter/material.dart';

class ThemeUtils {
  ThemeUtils._();

  static Color getDividerColor(ThemeData theme) =>
      theme.colorScheme.primaryContainer.withAlpha(200);
}
