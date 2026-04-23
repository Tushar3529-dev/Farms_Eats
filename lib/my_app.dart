import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:software_lab/features/authentication/screens/onBoarding/on_boarding_screen.dart';
import 'package:software_lab/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      
      themeMode:ThemeMode.system ,
      theme: STAppTheme.lightTheme,
      darkTheme: STAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const OnBoardingScreen(),
    );
  }
}