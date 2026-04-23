import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:software_lab/features/authentication/screens/onBoarding/widget/join_the_movement_button.dart';
import 'package:software_lab/features/authentication/screens/onBoarding/widget/login_on_board_screen_button.dart';
import 'package:software_lab/features/authentication/screens/onBoarding/widget/on_boarding_dot_navigation.dart';
import 'package:software_lab/utils/constants/colors.dart';
import 'package:software_lab/utils/constants/text_string.dart';
import 'package:software_lab/utils/helpers/helper_function.dart';

class OnBoardingWhiteTextPart extends StatelessWidget {
  final Color color;
  final String headerTitle;
  final String subTitle;
  const OnBoardingWhiteTextPart({

    required this.color,
    required this.headerTitle,
    required this.subTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = STHelperFunction.isDarkMode(context);
    return Stack(
      children: [
        Positioned(
          top: 475, 
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color:  dark ? STAppColors.dark : STAppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                 SizedBox(height: 30),
                Text(
                  headerTitle,
                  style: GoogleFonts.beVietnamPro(fontSize: 24, fontWeight: FontWeight.bold,color:  dark ? STAppColors.light : STAppColors.dark),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  subTitle,
                   style: GoogleFonts.beVietnamPro(fontSize: 14,color: dark ? STAppColors.light : STAppColors.dark),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50),
        
                /// Dots
              const onBoardingDotNavigation(),
        
                SizedBox(height: 67),
        
                /// Button
               
                JoinTheMovementButton(color: color,),
         SizedBox(height: 17),
        
                LoginOnBoardScreenButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}