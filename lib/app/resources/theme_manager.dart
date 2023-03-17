import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled1/app/resources/style_manager.dart';
import 'package:untitled1/app/resources/values_manager.dart';
import 'colors_manager.dart';
import 'fonts_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorManager.white,
    primaryColor: ColorManager.primaryColor,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightGrey,
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.lightGrey,
      elevation: AppSize.s4,
    ),
    appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarIconBrightness: Brightness.dark),
        color: ColorManager.primaryColor,
        shadowColor: ColorManager.lightPrimary,
        elevation: AppSize.s4,
        centerTitle: true,
        titleTextStyle:
            getRegularStyle(fontSize: FontSize.s16, color: ColorManager.white)),
    buttonTheme: ButtonThemeData(
      buttonColor: ColorManager.primaryColor,
      splashColor: ColorManager.lightPrimary,
      shape: const StadiumBorder(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
                fontSize: FontSize.s18, color: ColorManager.white),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s16)))),
    textTheme: TextTheme(
      titleLarge:getSemiBoldStyle(fontSize: FontSize.s16, color: ColorManager.darkGrey),
        titleMedium: getMediumStyle(fontSize: FontSize.s14, color: ColorManager.darkGrey),
        bodyLarge: getRegularStyle(fontSize: FontSize.s18, color: ColorManager.grey1),
        headlineLarge: getSemiBoldStyle(fontSize: FontSize.s16, color: ColorManager.darkGrey,),
        headlineMedium: getRegularStyle(fontSize: FontSize.s16, color: ColorManager.primaryColor,),
        bodySmall: getRegularStyle(fontSize: FontSize.s14, color: ColorManager.grey)),
    inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppSize.s8),
        hintStyle:
            getRegularStyle(fontSize: FontSize.s14, color: ColorManager.grey),
        labelStyle:
            getMediumStyle(fontSize: FontSize.s14, color: ColorManager.grey),
        errorStyle:
            getRegularStyle(fontSize: FontSize.s14, color: ColorManager.error),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1),
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primaryColor, width: AppSize.s1),
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primaryColor, width: AppSize.s1),
          borderRadius: BorderRadius.circular(AppSize.s10),
        )),
  );
}
