import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';

/// Helper class for managing themes and colors.
class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    PrefUtils().setThemeData(_newTheme);
    Get.forceAppUpdate();
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.gray10003,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.h),
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
            color: appTheme.gray50001,
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 3,
        space: 3,
        color: colorScheme.primary,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.gray500,
          fontSize: 17.fSize,
          fontFamily: 'Inria Sans',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.black900.withOpacity(0.53),
          fontSize: 13.fSize,
          fontFamily: 'Inria Sans',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.gray50002,
          fontSize: 12.fSize,
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w400,
        ),
        displayMedium: TextStyle(
          color: colorScheme.onPrimary.withOpacity(1),
          fontSize: 42.fSize,
          fontFamily: 'Josefin Sans',
          fontWeight: FontWeight.w700,
        ),
        displaySmall: TextStyle(
          color: colorScheme.primary,
          fontSize: 34.fSize,
          fontFamily: 'Inria Sans',
          fontWeight: FontWeight.w700,
        ),
        headlineLarge: TextStyle(
          color: colorScheme.primary,
          fontSize: 32.fSize,
          fontFamily: 'Inria Sans',
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 28.fSize,
          fontFamily: 'Inria Sans',
          fontWeight: FontWeight.w700,
        ),
        labelLarge: TextStyle(
          color: colorScheme.primary,
          fontSize: 12.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 22.fSize,
          fontFamily: 'Inria Sans',
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          color: appTheme.gray10001,
          fontSize: 17.fSize,
          fontFamily: 'Inria Sans',
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          color: appTheme.blueGray300,
          fontSize: 14.fSize,
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFF004225),
    primaryContainer: Color(0XFFADADAF),
    secondaryContainer: Color(0X87004225),

    // Error colors
    errorContainer: Color(0X19C33F15),
    onError: Color(0XFF4D2161),
    onErrorContainer: Color(0X26000249),

    // On colors(text colors)
    onPrimary: Color(0X0FFFFFFF),
    onPrimaryContainer: Color(0XFF191D31),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Black
  Color get black900 => Color(0XFF000000);

  // BlueGray
  Color get blueGray100 => Color(0XFFCECECE);
  Color get blueGray200 => Color(0XFFB1B8C7);
  Color get blueGray300 => Color(0XFF8E8EA9);
  Color get blueGray30001 => Color(0XFFA7A9B7);
  Color get blueGray30002 => Color(0XFFA5A5BA);
  Color get blueGray400 => Color(0XFF8D8D8D);
  Color get blueGray50 => Color(0XFFEEF0F7);
  Color get blueGray5001 => Color(0XFFEEF1F8);
  Color get blueGray600 => Color(0XFF586172);
  Color get blueGray60001 => Color(0XFF666687);
  Color get blueGray900 => Color(0XFF212134);
  Color get blueGray90001 => Color(0XFF343434);
  Color get blueGray90002 => Color(0XFF092342);
  Color get blueGray90019 => Color(0X192F2F2F);

  // BlueGrayf
  Color get blueGray2003f => Color(0X3FB1B8C8);

  // BlueGraya
  Color get blueGray9000a => Color(0X0A323247);

  // DeepOrange
  Color get deepOrangeA400 => Color(0XFFFA4A0C);

  // Gray
  Color get gray100 => Color(0XFFF4F4F8);
  Color get gray10001 => Color(0XFFF6F6F9);
  Color get gray10002 => Color(0XFFF7F7F7);
  Color get gray10003 => Color(0XFFF5F5F8);
  Color get gray10004 => Color(0XFFF5F5F5);
  Color get gray10005 => Color(0XFFF2F2F2);
  Color get gray200 => Color(0XFFEEEEEE);
  Color get gray20001 => Color(0XFFEBEBEB);
  Color get gray20002 => Color(0XFFEFEEEE);
  Color get gray400 => Color(0XFFBDBDBD);
  Color get gray50 => Color(0XFFF9F9F9);
  Color get gray500 => Color(0XFF99999D);
  Color get gray50001 => Color(0XFF8F92A1);
  Color get gray50002 => Color(0XFF9D9D9D);
  Color get gray50003 => Color(0XFF9F9F9F);
  Color get gray5001 => Color(0XFFFCFCFC);
  Color get gray60019 => Color(0X19717171);
  Color get gray700 => Color(0XFF5B5B5B);
  Color get gray80019 => Color(0X19393939);
  Color get gray900 => Color(0XFF1D272F);
  Color get gray90001 => Color(0XFF1E1E1E);

  // Green
  Color get green900 => Color(0XFF114200);

  // Indigo
  Color get indigo50 => Color(0XFFE7EAF1);
  Color get indigoA200 => Color(0XFF476BEA);

  // Orange
  Color get orange700 => Color(0XFFF47A0A);

  // Teal
  Color get teal100 => Color(0XFFB5E2D7);
  Color get teal700 => Color(0XFF0C8C56);

  // White
  Color get whiteA700 => Color(0XFFFDFDFE);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
