import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:password_generator/utils/color_palette.dart';

ThemeData buildThemeData() {
  return ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.montserrat().fontFamily,
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kBackgroundColor1,
    sliderTheme: SliderThemeData(
      thumbColor: Colors.white,
      activeTrackColor: kPrimaryColor,
      inactiveTrackColor: kBackgroundColor1,
      overlayShape: SliderComponentShape.noOverlay,
      trackHeight: 5.0,
      trackShape: const RectangularSliderTrackShape(),
    ),
    checkboxTheme: CheckboxThemeData(
      overlayColor: MaterialStateProperty.all<Color>(
        Colors.transparent,
      ),
      checkColor: MaterialStateProperty.all<Color>(
        kBackgroundColor1,
      ),
      shape: RoundedRectangleBorder(),
    ),
    snackBarTheme: const SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(),
    ),
  );
}
