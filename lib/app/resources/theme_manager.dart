import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled1/app/resources/style_manager.dart';
import 'package:untitled1/app/resources/values_manager.dart';
import 'colors_manager.dart';
import 'fonts_manager.dart';

ThemeData getLightApplicationTheme() {
  return ThemeData(
    iconTheme: IconThemeData(
      color: ColorManagerLight.white,
      size: AppSize.s25
    ),
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
              fontSize: FontSize.s18, color: ColorManagerLight.white),
          titleMedium: getMediumStyle(
              fontSize: FontSize.s16, color: ColorManagerLight.white),
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
      switchTheme: SwitchThemeData(

        splashRadius: 20,
          trackColor: MaterialStateProperty.all(Colors.blueGrey),
          thumbColor: MaterialStateProperty.all(ColorManagerLight.white)));
}

ThemeData getDarkApplicationTheme() {
  return ThemeData(
    iconTheme: IconThemeData(
        color: ColorManagerLight.white,
        size: AppSize.s25
    ),
    scaffoldBackgroundColor: ColorManagerDark.primaryColor,
    primaryColor: ColorManagerDark.primaryColor,
    primarySwatch: Colors.grey,
    disabledColor: ColorManagerDark.grey,
    splashColor: ColorManagerDark.lightGrey,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: ColorManagerDark.white
      ),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManagerDark.primaryColor,
            statusBarIconBrightness: Brightness.light),
        color: Colors.transparent,
        shadowColor: ColorManagerDark.lightPrimary,
        elevation: AppSize.s4,
        centerTitle: true,
        titleTextStyle: getRegularStyle(
            fontSize: FontSize.s16, color: ColorManagerDark.white)),
    buttonTheme: ButtonThemeData(
      buttonColor: ColorManagerDark.primaryColor,
      splashColor: ColorManagerDark.lightPrimary,
      shape: const StadiumBorder(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
                fontSize: FontSize.s18, color: ColorManagerDark.white),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s16)))),
    textTheme: TextTheme(
        titleLarge: getSemiBoldStyle(
            fontSize: FontSize.s18, color: ColorManagerDark.white),
        titleMedium: getMediumStyle(
            fontSize: FontSize.s16, color: ColorManagerDark.white),
        titleSmall: getRegularStyle(
            fontSize: FontSize.s14, color: ColorManagerDark.grey)),
    switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.all(Colors.blueGrey),
        thumbColor: MaterialStateProperty.all(ColorManagerDark.white)),
    inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppSize.s8),
        hintStyle: getRegularStyle(
            fontSize: FontSize.s14, color: ColorManagerDark.white),
        labelStyle: getMediumStyle(
            fontSize: FontSize.s14, color: ColorManagerDark.white),
        errorStyle: getRegularStyle(
            fontSize: FontSize.s14, color: ColorManagerDark.red),
        border: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManagerDark.grey, width: AppSize.s1),
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ColorManagerDark.primaryColor, width: AppSize.s1),
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ColorManagerDark.primaryColor, width: AppSize.s1),
          borderRadius: BorderRadius.circular(AppSize.s10),
        )),
  );
}
