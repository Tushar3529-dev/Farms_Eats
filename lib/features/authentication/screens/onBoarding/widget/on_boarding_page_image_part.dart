import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:software_lab/utils/constants/image_string.dart';

class onBoardingPageImagePart extends StatelessWidget {
  final Color color;
  final String imagePath;
  const onBoardingPageImagePart({
    required this.imagePath,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
        /*   topLeft: Radius.circular(30),
          topRight: Radius.circular(30), */
        ),
        
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: SvgPicture.asset(
          imagePath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}



