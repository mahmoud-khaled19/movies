import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled1/app/resources/style_manager.dart';
import 'package:untitled1/app/resources/values_manager.dart';
import 'colors_manager.dart';
import 'fonts_manager.dart';

ThemeData getLightApplicationTheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorManagerLight.primaryColor,
    primarySwatch: Colors.grey,
    primaryColor: ColorManagerLight.primaryColor,
    disabledColor: ColorManagerLight.grey,
    splashColor: ColorManagerLight.lightGrey,
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: ColorManagerLight.white),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManagerLight.primaryColor,
            statusBarIconBrightness: Brightness.light),
        color: ColorManagerLight.primaryColor,
        shadowColor: ColorManagerLight.lightPrimary,
        elevation: AppSize.s4,
        centerTitle: true,
        titleTextStyle: getRegularStyle(
            fontSize: FontSize.s16, color: ColorManagerLight.white)),
    buttonTheme: ButtonThemeData(
      buttonColor: ColorManagerLight.primaryColor,
      splashColor: ColorManagerLight.lightPrimary,
      shape: const StadiumBorder(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
                fontSize: FontSize.s18, color: ColorManagerLight.white),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s16)))),
    textTheme: TextTheme(
        titleLarge: getSemiBoldStyle(
            fontSize: FontSize.s16, color: ColorManagerLight.white),
        titleMedium: getMediumStyle(
            fontSize: FontSize.s14, color: ColorManagerLight.white),
        titleSmall: getRegularStyle(
            fontSize: FontSize.s14, color: ColorManagerLight.white)),
    inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppSize.s8),
        hintStyle: getRegularStyle(
            fontSize: FontSize.s14, color: ColorManagerLight.lightGrey),
        labelStyle: getMediumStyle(
            fontSize: FontSize.s14, color: ColorManagerLight.lightGrey),
        errorStyle: getRegularStyle(
            fontSize: FontSize.s14, color: ColorManagerLight.red),
        border: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManagerLight.grey, width: AppSize.s1),
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ColorManagerLight.primaryColor, width: AppSize.s1),
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ColorManagerLight.primaryColor, width: AppSize.s1),
          borderRadius: BorderRadius.circular(AppSize.s10),
        )),
  );
}

ThemeData getDarkApplicationTheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorManagerLight.primaryColor,
    primaryColor: ColorManagerLight.primaryColor,
    primarySwatch: Colors.grey,
    disabledColor: ColorManagerLight.grey,
    splashColor: ColorManagerLight.lightGrey,
    appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManagerLight.primaryColor,
            statusBarIconBrightness: Brightness.light),
        color: Colors.transparent,
        shadowColor: ColorManagerLight.lightPrimary,
        elevation: AppSize.s4,
        centerTitle: true,
        titleTextStyle: getRegularStyle(
            fontSize: FontSize.s16, color: ColorManagerLight.white)),
    buttonTheme: ButtonThemeData(
      buttonColor: ColorManagerLight.primaryColor,
      splashColor: ColorManagerLight.lightPrimary,
      shape: const StadiumBorder(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
                fontSize: FontSize.s18, color: ColorManagerLight.white),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s16)))),
    textTheme: TextTheme(
        titleLarge: getSemiBoldStyle(
            fontSize: FontSize.s22, color: ColorManagerLight.white),
        titleMedium: getMediumStyle(
            fontSize: FontSize.s14, color: ColorManagerLight.white),
        titleSmall: getRegularStyle(
            fontSize: FontSize.s14, color: ColorManagerLight.grey)),
    inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppSize.s8),
        hintStyle: getRegularStyle(
            fontSize: FontSize.s14, color: ColorManagerLight.white),
        labelStyle: getMediumStyle(
            fontSize: FontSize.s14, color: ColorManagerLight.white),
        errorStyle: getRegularStyle(
            fontSize: FontSize.s14, color: ColorManagerLight.red),
        border: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManagerLight.grey, width: AppSize.s1),
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ColorManagerLight.primaryColor, width: AppSize.s1),
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ColorManagerLight.primaryColor, width: AppSize.s1),
          borderRadius: BorderRadius.circular(AppSize.s10),
        )),
  );
}
