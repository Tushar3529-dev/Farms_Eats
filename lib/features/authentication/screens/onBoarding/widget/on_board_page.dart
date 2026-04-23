import 'package:flutter/material.dart';
import 'package:software_lab/features/authentication/screens/onBoarding/widget/on_boarding_page_image_part.dart';
import 'package:software_lab/features/authentication/screens/onBoarding/widget/on_boarding_white_text_part.dart';

class OnBoardPage extends StatelessWidget {
  final Color color;
    final String headerTitle;
  final String subTitle;
  final String imagePath;
  const OnBoardPage({
    required this.headerTitle,
    required this.subTitle,
    required this.imagePath,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
    
       
        onBoardingPageImagePart(color: color, imagePath: imagePath),
    
       
        OnBoardingWhiteTextPart(color: color, headerTitle: headerTitle, subTitle: subTitle),
      ],
    );
  }
}