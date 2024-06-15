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
          color: Color.fromRGBO(14,17,17, 1),
          fontSize: 36.fSize,
          fontFamily: 'Tiro Devanagari Hindi',
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: TextStyle(
          color: Color.fromRGBO(14,17,17, 1),
          fontSize: 28.fSize,
          fontFamily: 'Inria Sans',
          fontWeight: FontWeight.w400,
        ),
        titleLarge: TextStyle(
          color: Color.fromARGB(255, 85, 85, 221),
          fontSize: 14.fSize,
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
          color:Color.fromRGBO(14,17,17,1) ,
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
    primary: Color.fromRGBO(62, 146, 204, 1),
    // onPrimary: Color(0XFFFFFFFF),
    // onPrimaryContainer: Color(0XFFFF0000),
     onPrimary: Color.fromRGBO(250, 249, 246, 1),
    // onPrimaryContainer: Color.fromARGB(255, 31, 243, 1), // 
  );
}

class LightCodeColors {
  // Black
  Color get black900 => Color.fromRGBO(14,17,17,1); // back
// Blackf
  Color get black9007f => Color.fromRGBO(14,17,17,1);
// BlueGray
  Color get blueGray100 => Color(0XFFD9D9D9);
  Color get blueGray400 => Color.fromRGBO(14,17,17, 1);

  Color get gray300 => Color(0XFFE6E6E6);
  Color get gray900 => Color.fromRGBO(14,17,17,1);

  // Color get black400 => Color.fromRGBO(255, 205, 210, 1);
  Color get black400 => Color.fromRGBO(250, 249, 246, 1);
  // Color get black400 => Color.fromRGBO(240, 74, 96, 1);
  Color get insta => Color.fromRGBO(252, 228, 236, 1);
  Color get smap => Color.fromARGB(181, 236, 255, 30);
  Color get cyan300 => Color.fromRGBO(	124	,124,	229, 1);

  get gray600 => null;

  get blueGray50 => null;

// Blue
  Color get blue50 => Color(0XFFE8F1FF);
  Color get blueGray900 => Color(0XFF202244);
// DeepOrange
// DeepPurple
  Color get deepcyanA200 => Color.fromARGB(255, 85, 85, 221);
// Gray
  Color get gray200 => Color.fromRGBO(252, 228, 236,1);
  Color get gray50 => Colors.white;
  // Color get gray00 => Color(0XFF545454);
// LightGreen
  Color get lightGreenA700 => Color(0XFF45CD2F); // can't detele
// Red

// White
  Color get whiteA700 => Color(0XFFFFFFFF);
}
