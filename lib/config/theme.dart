import 'package:flutter/material.dart';
import 'package:universityhup/core/style/colors.dart';

ThemeData appTheme = ThemeData(
    // scaffoldBackgroundColor: AppColor.backgroundColor,
    // appBarTheme: AppBarTheme(
    //     iconTheme: IconThemeData(
    //       color: Color(0xff212121),
    //     ),
    //     systemOverlayStyle: SystemUiOverlayStyle(
    //         statusBarColor: AppColor.lightBackgroundColor,
    //         statusBarIconBrightness: Brightness.dark),
    //     color: AppColor.lightBackgroundColor,
    //     elevation: 0,
    //     titleTextStyle: TextStyle(
    //         color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),

    drawerTheme: const DrawerThemeData(
      scrimColor: Colors.transparent,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: KColors.primaryColor,
      ),

      titleMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: KColors.primaryColor,
      ),

      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: KColors.subTitleColor,
      ),

      // labelSmall: TextStyle(
      //     fontSize: 14,
      //     fontWeight: FontWeight.w400,
      //     color: Colors.grey[500],
      //   ),
      //   labelMedium: TextStyle(
      //     fontSize: 15,
      //     fontWeight: FontWeight.bold,
      //     color: Colors.black,
      //   ),
      //   labelLarge: TextStyle(
      //     fontSize: 20,
      //     fontWeight: FontWeight.w500,
      //     color: Colors.black,
      //   ),

      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: KColors.primaryColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: KColors.primaryColor,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: KColors.subTitleColor,
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: KColors.greyColor,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: const TextStyle(color: KColors.primaryColor),
        iconColor: KColors.secondaryColor,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: KColors.secondaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: KColors.primaryColor),
          borderRadius: BorderRadius.circular(8),
        )));
