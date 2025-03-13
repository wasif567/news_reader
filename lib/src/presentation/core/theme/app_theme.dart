/* import 'package:flutter/material.dart';

class AppThemes {
  // Dark Theme
  static final darkTheme = ThemeData(
    fontFamily: 'Inter',
    useMaterial3: true,
    primarySwatch: Colors.grey,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.scaffoldDarkTheme,
    brightness: Brightness.dark,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.white,
    ),
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor, brightness: Brightness.dark),
    dividerColor: AppColors.black,
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xff50577A)),
    cardTheme: const CardTheme(
      color: AppColors.cardDarkTheme,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              const Color(0xff50577A),
            ),
            foregroundColor: WidgetStateProperty.all(Colors.black))),
    textTheme: const TextTheme(
        headlineMedium: TextStyle(
          color: AppColors.white,
          fontSize: 20.0,
        ),
        headlineSmall: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
        headlineLarge: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        titleMedium: TextStyle(
            color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w700),
        titleSmall: TextStyle(
          color: Colors.black,
          fontSize: 9.0,
        ),
        labelLarge: TextStyle(
            color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w400),
        labelSmall: TextStyle(
            color: Colors.white, fontSize: 9.0, fontWeight: FontWeight.w400),
        labelMedium: TextStyle(
            color: Colors.white, fontSize: 13.0, fontWeight: FontWeight.w400)),
  );

  // Light Theme
  static final lightTheme = ThemeData(
    fontFamily: 'Inter',
    useMaterial3: true,
    primarySwatch: Colors.grey,
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor, brightness: Brightness.light),
    primaryColor: AppColors.primaryColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xff19AEAD), foregroundColor: Colors.white),
    dividerColor: Colors.white54,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              AppColors.primaryColor,
            ),
            foregroundColor: WidgetStateProperty.all(Colors.white))),
    iconTheme: const IconThemeData(),
    cardTheme: const CardTheme(
      color: Colors.white,
    ),
    shadowColor: AppColors.black.withValues(alpha: 0.1),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
      ),
      headlineSmall: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
      headlineLarge: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
      ),
      titleMedium: TextStyle(
          color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w700),
      titleSmall: TextStyle(
        color: Colors.black,
        fontSize: 9.0,
      ),
      labelLarge: TextStyle(
          color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w700),
      labelSmall: TextStyle(
          color: Colors.black, fontSize: 9.0, fontWeight: FontWeight.w400),
      labelMedium: TextStyle(
          color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
    ),
  );
}

getDatePickerBuilder(BuildContext context) => (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          datePickerTheme: DatePickerThemeData(
            /* confirmButtonStyle: ButtonStyle(
              textStyle:
                  MaterialStateProperty.all(AppTypography.interMedium.copyWith(
                color: AppColors.white,
              )),
            ), */
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            weekdayStyle: AppTypography.interMedium
                .copyWith(color: AppColors.getTextColor(context)),
            dayStyle: AppTypography.interMedium.copyWith(),
          ),
          colorScheme: ColorScheme.light(
            primary: Theme.of(context).primaryColor, // <-- SEE HERE
            onPrimary: Colors.white, // <-- SEE HERE
            onSurface: AppColors.getTextColor(context), // <-- SEE HERE
          ),
          textTheme: TextTheme(
            labelLarge: AppTypography.interMedium.copyWith(
                fontSize: 16,
                color:
                    AppColors.getTextColor(context)), //TextStyle(fontSize: 16),
            labelMedium: AppTypography.interMedium.copyWith(
                fontSize: 14,
                color:
                    AppColors.getTextColor(context)), //TextStyle(fontSize: 14),
            labelSmall: AppTypography.interMedium.copyWith(
                fontSize: 10,
                color:
                    AppColors.getTextColor(context)), //TextStyle(fontSize: 10),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor:
                  AppColors.getTextColor(context), // button text color
            ),
          ),
        ),
        child: child!,
      );
    };

getTimePickerBuilder(BuildContext context) => (context, child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: child,
      );
    };
 */
