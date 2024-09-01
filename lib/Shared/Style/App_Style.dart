import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../constant.dart';





ThemeData Light_Theme = ThemeData(
  drawerTheme: const DrawerThemeData(
    scrimColor: Colors.transparent,
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.transparent,

  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: Colors.blue,

  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,





  ),


  textTheme: TextTheme(

    bodyMedium:TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w900,
      color: HexColor('#0D1B2A'),
    ),
    displayLarge:TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w900,
      color: HexColor('#0D1B2A'),
    ),
    bodySmall:TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: c1.withOpacity(.7),
    ),
  ),


);

ThemeData Dark_Theme = ThemeData();