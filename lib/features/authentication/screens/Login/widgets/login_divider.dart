import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:software_lab/utils/constants/colors.dart';
import 'package:software_lab/utils/helpers/helper_function.dart';

class STFormDivider extends StatelessWidget {
  final String dividerText;
  const STFormDivider({super.key, required this.dividerText});

  @override
  Widget build(BuildContext context) {
    final dark = STHelperFunction.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark ? STAppColors.darkGrey : STAppColors.grey,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(dividerText, style: Theme.of(context).textTheme.labelMedium),
        Flexible(
          child: Divider(
            color: dark ? STAppColors.darkGrey : STAppColors.grey,
            thickness: 0.5,
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}