import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:software_lab/features/authentication/controllers/on_boarding_controller.dart';
import 'package:software_lab/features/authentication/screens/onBoarding/widget/on_board_page.dart';
import 'package:software_lab/utils/constants/image_string.dart';
import 'package:software_lab/utils/constants/text_string.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
  body: PageView(
     controller: controller.pagecontroller,
            onPageChanged: controller.updatePageIndicator,
    children: [
      OnBoardPage(  color: Color.fromRGBO(94, 162, 95, 1),
      headerTitle: STAppTexts.tOnBoardingTitle1,
      subTitle: STAppTexts.tOnBoardingSubTitle1,
      imagePath: STAppImages.onBoardingImage1,),
        OnBoardPage(  color: Color.fromRGBO(213, 113, 91, 1),
      headerTitle: STAppTexts.tOnBoardingTitle2,
      subTitle: STAppTexts.tOnBoardingSubTitle2,
      imagePath: STAppImages.onBoardingImage2,),
          OnBoardPage(  color: Color.fromRGBO(248, 197, 105, 1),
      headerTitle: STAppTexts.tOnBoardingTitle3,
      subTitle: STAppTexts.tOnBoardingSubTitle3,
      imagePath: STAppImages.onBoardingImage3,),
    ],
  ),
);
  }
}





