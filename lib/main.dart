import 'package:another_buddy/features/initialise/initialise_screen.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:reflectable/reflectable.dart';

import 'main.reflectable.dart';

void main() {
  initializeReflectable();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final _appPrimaryColor = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme lightColorScheme;
        ColorScheme darkColorScheme;

        if (lightDynamic != null && darkDynamic != null) {
          // On Android S+ devices, use the provided dynamic color scheme.
          // (Recommended) Harmonize the dynamic color scheme' built-in semantic colors.
          lightColorScheme = lightDynamic.harmonized();
          // (Optional) Customize the scheme as desired. For example, one might
          // want to use a brand color to override the dynamic [ColorScheme.secondary].
          lightColorScheme =
              lightColorScheme.copyWith(secondary: _appPrimaryColor);
          // (Optional) If applicable, harmonize custom colors.
          // lightCustomColors = lightCustomColors.harmonized(lightColorScheme);

          // Repeat for the dark color scheme.
          darkColorScheme = darkDynamic.harmonized();
          darkColorScheme =
              darkColorScheme.copyWith(secondary: _appPrimaryColor);
          // darkCustomColors = darkCustomColors.harmonized(darkColorScheme);

          // _isDemoUsingDynamicColors = true; // ignore, only for demo purposes
        } else {
          // Otherwise, use fallback schemes.
          lightColorScheme = ColorScheme.fromSeed(
            seedColor: _appPrimaryColor,
          );
          darkColorScheme = ColorScheme.fromSeed(
            seedColor: _appPrimaryColor,
            brightness: Brightness.dark,
          );
        }

        return MaterialApp(
          theme: ThemeData(
            colorScheme: lightColorScheme,
            useMaterial3: true,
            // extensions: [lightCustomColors],
          ),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme,
            useMaterial3: true,
            // extensions: [darkCustomColors],
          ),
          home: const InitialiseScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
