import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:software_lab/features/authentication/controllers/on_boarding_controller.dart';
import 'package:software_lab/utils/constants/colors.dart';
import 'package:software_lab/utils/constants/sizes.dart';
import 'package:software_lab/utils/devices/device_utliity.dart';
import 'package:software_lab/utils/helpers/helper_function.dart';

class onBoardingDotNavigation extends StatelessWidget {
  const onBoardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = STHelperFunction.isDarkMode(context);
    return SmoothPageIndicator(
      effect: ExpandingDotsEffect(
        activeDotColor: dark ? STAppColors.light : STAppColors.dark,
        dotHeight: 6,
      ),
      controller: controller.pagecontroller,
      onDotClicked: controller.dotNavigationClick,
      count: 3,
    );
  }
}