
import 'package:flutter/material.dart';
import 'package:software_lab/utils/constants/colors.dart';
import 'package:software_lab/utils/constants/image_string.dart';
import 'package:software_lab/utils/constants/sizes.dart';

class STSocialButtons extends StatelessWidget {
  const STSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
           width: 96,
          height: 52,
          decoration: BoxDecoration(
            border: Border.all(color: STAppColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: STAppSizes.iconMd,
              height: STAppSizes.iconMd,
              image: AssetImage(STAppImages.googleLogo),
            ),
          ),
        ),
        const SizedBox(width: STAppSizes.spaceBtwItems),
         Container(
           width: 96,
          height: 52,
          decoration: BoxDecoration(
            border: Border.all(color: STAppColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: STAppSizes.iconMd,
              height: STAppSizes.iconMd,
              image: AssetImage(STAppImages.appleLogo),
            ),
          ),
        ),
        const SizedBox(width: STAppSizes.spaceBtwItems),
        Container(
          width: 96,
          height: 52,
          decoration: BoxDecoration(
            border: Border.all(color: STAppColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            

            onPressed: () {},
            icon: const Image(
              width: STAppSizes.iconLg,
              height: STAppSizes.iconLg,

              image: AssetImage(STAppImages.facebookLogo),
            ),
          ),
        ),
      ],
    );
  }
}
