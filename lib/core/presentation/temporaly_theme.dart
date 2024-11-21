import 'package:flutter/material.dart';

class TemporalyTheme extends StatelessWidget {
  final Widget child;

  const TemporalyTheme({super.key, required this.child});

  static const ColorScheme lightColorScheme = ColorScheme.light(
    primary: Color(0xff2979ff),
    secondary: Color(0xff888888),
    tertiary: Color(0xffcccccc),
    surface: Color(0xffffffff),
    onSurface: Color(0xff000000),
  );

  static const ColorScheme darkColorScheme = ColorScheme.dark(
    primary: Color(0xff2979ff),
    secondary: Color(0xff888888),
    tertiary: Color(0xffa17d7d),
    surface: Color(0xff121212),
    onSurface: Color(0xffffffff),
  );

  static const TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 88,
      letterSpacing: 0.5,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 56,
      letterSpacing: 0.5,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 16,
      letterSpacing: 0.5,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 12,
      letterSpacing: 0.5,
    ),
    headlineLarge: TextStyle(
      fontFamily: 'ProductSans',
      fontWeight: FontWeight.bold,
      fontSize: 18,
      letterSpacing: 0.5,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'ProductSans',
      fontWeight: FontWeight.bold,
      fontSize: 17,
      letterSpacing: 0.5,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'ProductSans',
      fontWeight: FontWeight.bold,
      fontSize: 16,
      letterSpacing: 0.5,
    ),
    titleLarge: TextStyle(
      fontFamily: 'ProductSans',
      fontWeight: FontWeight.bold,
      fontSize: 14,
      letterSpacing: 0.5,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Urbanist',
      fontWeight: FontWeight.w500,
      fontSize: 14,
      letterSpacing: 0.5,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Urbanist',
      fontWeight: FontWeight.w500,
      fontSize: 12,
      letterSpacing: 0.5,
    ),
    labelLarge: TextStyle(
      fontFamily: 'ProductSans',
      fontWeight: FontWeight.normal,
      fontSize: 14,
      letterSpacing: 0.5,
    ),
    labelMedium: TextStyle(
      fontFamily: 'ProductSans',
      fontWeight: FontWeight.normal,
      fontSize: 12,
      letterSpacing: 0.5,
    ),
    labelSmall: TextStyle(
      fontFamily: 'ProductSans',
      fontWeight: FontWeight.normal,
      fontSize: 8,
      letterSpacing: 0.5,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    final ColorScheme colorScheme =
        isDarkTheme ? darkColorScheme : lightColorScheme;

    return Theme(
      data: ThemeData(
        colorScheme: colorScheme,
        textTheme: textTheme,
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.surface,
            foregroundColor: colorScheme.onSurface,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: colorScheme.surface.withOpacity(0.1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: colorScheme.onSurface.withOpacity(0.5),
            ),
          ),
        ),
      ),
      child: child,
    );
  }
}
