import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors/colors.dart';

export 'colors/colors.dart';

abstract class AppTheme {
  static final light = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: BrandColor.base),
    useMaterial3: true,
    fontFamily: GoogleFonts.ubuntu().fontFamily,
    scaffoldBackgroundColor: GreyColor.white,
    switchTheme: SwitchThemeData(
      thumbColor: const WidgetStatePropertyAll(Colors.white),
      trackOutlineColor: const WidgetStatePropertyAll(
        Colors.transparent,
      ),
      trackOutlineWidth: const WidgetStatePropertyAll(0),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return BrandColor.base;
        }

        return GreyColor.medium;
      }),
    ),
    appBarTheme: AppBarTheme(
      color: GreyColor.white,
      elevation: 0,
      centerTitle: false,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: GreyColor.white,
      modalBackgroundColor: GreyColor.white,
      modalElevation: 0,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8),
        ),
      ),
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        elevation: const WidgetStatePropertyAll(0),
        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
        shadowColor: const WidgetStatePropertyAll(Colors.transparent),
        foregroundColor: WidgetStatePropertyAll(BrandColor.base),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.disabled)) {
              return GreyColor.medium;
            }

            if (states.contains(WidgetState.pressed)) {
              return BrandColor.dark;
            }

            if (states.contains(WidgetState.hovered)) {
              return BrandColor.medium;
            }

            return BrandColor.base;
          },
        ),
        minimumSize: const WidgetStatePropertyAll(Size.fromHeight(54)),
        foregroundColor: WidgetStatePropertyAll(GreyColor.white),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        minimumSize: const WidgetStatePropertyAll(Size.fromHeight(54)),
        backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return GreyColor.medium;
          }
          if (states.contains(WidgetState.pressed)) {
            return BrandColor.dark;
          }
          if (states.contains(WidgetState.hovered)) {
            return BrandColor.medium;
          }

          return BrandColor.base;
        }),
        side: WidgetStateProperty.resolveWith(
          (states) {
            Color? color;

            if (states.contains(WidgetState.disabled)) {
              color = GreyColor.medium;
            }
            if (states.contains(WidgetState.pressed)) {
              color = BrandColor.dark;
            }
            if (states.contains(WidgetState.hovered)) {
              color = BrandColor.medium;
            }

            color = BrandColor.base;

            return BorderSide(
              color: color,
              width: 2,
            );
          },
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(BrandColor.base),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
        side: BorderSide.none,
      ),
      side: BorderSide.none,
      fillColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return BrandColor.base;
          }

          return GreyColor.light;
        },
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: GreyColor.lightest,
      isDense: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: GreyColor.medium,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: GreyColor.light,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: GreyColor.light,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: BrandColor.medium,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: AlertRedColor.base,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: AlertRedColor.base,
        ),
      ),
    ),
  );
}
