import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension on TextStyle {
  TextStyle get inika {
    return copyWith(
      fontFamily: 'Inika',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get tiroDevanagariHindi {
    return copyWith(
      fontFamily: 'Tiro Devanagari Hindi',
    );
  }
TextStyle get sourceSansPro {
    return copyWith(
      fontFamily: 'Source Sans Pro',
    );
  }

  TextStyle get islandMoments {
    return copyWith(
      fontFamily: 'Island Moments',
    );
  }
 TextStyle get jost {
    return copyWith(
      fontFamily: 'Jost',
    );
  }
  TextStyle get inriaSans {
    return copyWith(
      fontFamily: 'Inria Sans',
    );
  }

    TextStyle get mulish {
    return copyWith(
      fontFamily: 'Mulish',
    );
  }

}

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.
class CustomTextStyles {
  // Body text style
  static get bodyLargeInterGray900 => theme.textTheme.bodyLarge!.inter.copyWith(
        color: appTheme.gray900,
        fontSize: 18.fSize,
      );
  static get bodyLargeTiroDevanagariHindiOnPrimary =>
      theme.textTheme.bodyLarge!.tiroDevanagariHindi.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 17.fSize,
      );
  static get bodyLargeTiroDevanagariHindiOnPrimary17 =>
      theme.textTheme.bodyLarge!.tiroDevanagariHindi.copyWith(
        color: Color.fromRGBO(14,17,17, 1),
        fontSize: 17.fSize,
      );
  static get bodyLargeTiroDevanagariHindiPrimary =>
      theme.textTheme.bodyLarge!.tiroDevanagariHindi.copyWith(
        // color: theme.colorScheme.primary,
        color: Color.fromRGBO(62, 146, 204, 1),
        fontSize: 17.fSize,
      );
  static get bodySmallInterOnPrimary =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get bodySmallOnPrimaryContainer => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get bodySmallOnPrimaryContainer_1 =>
      theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
// Display text style
  static get displaySmallInter => theme.textTheme.displaySmall!.inter.copyWith(
        fontSize: 37.fSize,
      );
// Title text style
  static get titleLargeInriaSans =>
      theme.textTheme.titleLarge!.inriaSans.copyWith(
        fontSize: 20.fSize,
      );
  static get titleLargeBold => theme.textTheme.titleLarge!.copyWith(
      fontWeight: FontWeight.w700,
    );
  static get titleLarge20 => theme.textTheme.titleLarge!.copyWith(
        fontSize: 20.fSize,
      );
      //   static get bodyLargeSourceSansProOnPrimaryContainer =>
      // theme.textTheme.bodyLarge!.sourceSansPro.copyWith(
      //   color: theme.colorScheme.onPrimaryContainer,
      //   fontSize: 16.fSize,
      // );
      static get bodyLargeSourceSansProOnPrimaryContainer {
  final TextStyle? bodyLarge = theme.textTheme.bodyLarge;
  final Color? onPrimaryContainerColor = theme.colorScheme.onPrimaryContainer;

  // Check if either bodyLarge or onPrimaryContainerColor is null
  if (bodyLarge == null || onPrimaryContainerColor == null) {
    // Return a default style or handle null cases as appropriate
    return TextStyle(
      // Provide default values for properties
      fontFamily: 'SourceSansPro', // Example font family
      fontSize: 16.0, // Example font size
      color: Colors.black, // Example default color
    );
  }

  // If both bodyLarge and onPrimaryContainerColor are not null, return the style with the color
  return bodyLarge.copyWith(
    color: onPrimaryContainerColor,
  );
}

// Headline text style
  static get headlineLargeInriaSans =>
      theme.textTheme.headlineLarge!.inriaSans.copyWith(
        fontWeight: FontWeight.w700,
      );
      
// Title text style
  static get titleLargeJostBluegray900 =>
      theme.textTheme.titleLarge!.jost.copyWith(
        color: appTheme.blueGray100,
        fontSize: 21.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallBlack900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
      );
      static get labelLargeWhiteA700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700,
      );
// Title text style
  static get titleLargeInriaSansBlack900 =>
      theme.textTheme.titleLarge!.inriaSans.copyWith(
        color: appTheme.black900,
        fontSize: 20.fSize,
        fontWeight: FontWeight.w400,
      );
  static get titleLargeInriaSansBlack900Regular =>
      theme.textTheme.titleLarge!.inriaSans.copyWith(
        color: appTheme.black900,
        fontSize: 22.fSize,
        fontWeight: FontWeight.w400,
      );
  static get titleMediumBlack900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
      );
  static get titleMediumBlack900_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
      );
  static get titleMediumcyan200_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.deepcyanA200,
      );
  static get titleSmallExtraBold => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w800,
      );
  static get titleSmallJostBlack900 =>
      theme.textTheme.titleSmall!.jost.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallWhiteA700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w800,
      );
  static get titleSmallblakeA700 => theme.textTheme.titleSmall!.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.w800,
      );
}
