import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:software_lab/utils/theme/custome_themes/app_bar_theme.dart';
import 'package:software_lab/utils/theme/custome_themes/bottom_sheet.dart';
import 'package:software_lab/utils/theme/custome_themes/elevates_button_theme.dart';
import 'package:software_lab/utils/theme/custome_themes/outlined_button_theme.dart';
import 'package:software_lab/utils/theme/custome_themes/text_field_theme.dart';
import 'package:software_lab/utils/theme/custome_themes/text_theme.dart';

class STAppTheme {

  STAppTheme._();
    static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
   textTheme: GoogleFonts.poppinsTextTheme(STAappextTheme.lightTextTheme),
    brightness: Brightness.light,
    primaryColor: Colors.blue,
   
  
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: STAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: STBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: STAppElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: STOutLinedButtonTheme.lightOutlinedButtonThemeData,
    inputDecorationTheme: STTextFormFieldTheme.lightInputDecorationTheme,
  );
 static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
   
   textTheme: GoogleFonts.poppinsTextTheme(STAappextTheme.darkTextTheme),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: STAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: STBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: STAppElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: STOutLinedButtonTheme.darkOutlinedButtonThemeData,
    inputDecorationTheme: STTextFormFieldTheme.darkInputDecorationTheme,
  );
  
 
}