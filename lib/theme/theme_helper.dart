import 'dart:ui';
import 'package:flutter/material.dart';
import '../core/app_export.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.black400,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme.gray900.withOpacity(0.1),
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return Colors.transparent;
        }),
        side: BorderSide(
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.black9007f,
          fontSize: 19.fSize,
          fontFamily: 'Inria Sans',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.gray300,
          fontSize: 12.fSize,
          fontFamily: 'Inria Sans',
          fontWeight: FontWeight.w400,
        ),
        displayLarge: TextStyle(
          color: colorScheme.primary,
          fontSize: 65.fSize,
          fontFamily: 'Island Moments',
          fontWeight: FontWeight.w400,
        ),
        displaySmall: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 36.fSize,
          fontFamily: 'Tiro Devanagari Hindi',
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 28.fSize,
          fontFamily: 'Inria Sans',
          fontWeight: FontWeight.w400,
        ),
        titleLarge: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 23.fSize,
          fontFamily: 'Inika',
          fontWeight: FontWeight.w400,
        ),
      
        headlineLarge: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 33.fSize,
          fontFamily: 'Inika',
          fontWeight: FontWeight.w400,
        ),
      
        labelSmall: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 9.fSize,
          fontFamily: 'Inria Sans',
          fontWeight: FontWeight.w700,
        ),
       
        titleMedium: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 16.fSize,
          fontFamily: 'Inria Sans',
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 14.fSize,
          fontFamily: 'Inria Sans',
          fontWeight: FontWeight.w700,
        ),
        
        headlineSmall: TextStyle(
          color: appTheme.blueGray900,
          fontSize: 24.fSize,
          fontFamily: 'Jost',
          fontWeight: FontWeight.w600,
        ),
        labelLarge: TextStyle(
          color: appTheme.gray300,
          fontSize: 13.fSize,
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w700,
        ),
       
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light(
    primary: Color.fromARGB(255,31, 243, 197),
    // onPrimary: Color(0XFFFFFFFF),
    // onPrimaryContainer: Color(0XFFFF0000),
     onPrimary: Color.fromARGB(255, 255, 255, 255),
    onPrimaryContainer: Color.fromARGB(255, 31, 243, 197), // 
  );
}

/// Class containing custom colors for a lightCode theme.
class LightCodeColors {
  // Black
  Color get black900 => Color(0XFF000000); // back
// Blackf
  Color get black9007f => Color(0X7F000000);
// BlueGray
  Color get blueGray100 => Color(0XFFD9D9D9);
  Color get blueGray400 => Color(0XFF888888);
// DeepOrange
  Color get deepOrange600 => Color(0XFFF25022);
// Gray
  Color get gray300 => Color(0XFFE6E6E6);
  Color get gray900 => Color(0XFF1C1C1C);
// Red
  Color get black400 => Color.fromARGB(255, 45, 45, 45);
  Color get insta => Color.fromARGB(186, 253, 116, 116);
  Color get smap => Color.fromARGB(181, 236, 255, 30);
  Color get cyan300 => Color(0XFF4ADCF0);

  get gray600 => null;

  get blueGray50 => null;

// Blue
  Color get blue50 => Color(0XFFE8F1FF);
// BlueGray
  Color get blueGray10001 => Color(0XFFD9D9D9);
  Color get blueGray900 => Color(0XFF202244);
// DeepOrange
// DeepPurple
  Color get deepcyanA200 => Color.fromARGB(255, 31, 243, 197);
// Gray
  Color get gray200 => Color.fromARGB(255, 45,45,45);
  Color get gray50 => Color.fromARGB(255, 45,45,45,);
  Color get gray700 => Color(0XFF545454);
// LightGreen
  Color get lightGreenA700 => Color(0XFF45CD2F);
// Red

// White
  Color get whiteA700 => Color(0XFFFFFFFF);
}
