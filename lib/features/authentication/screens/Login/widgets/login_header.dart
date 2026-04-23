import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:software_lab/features/authentication/screens/SignUp/screen/sign_up_screen.dart';
import 'package:software_lab/utils/constants/sizes.dart';
import 'package:software_lab/utils/constants/text_string.dart';
import 'package:software_lab/utils/helpers/helper_function.dart';

class STLoginHeader extends StatelessWidget {
  const STLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = STHelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          STAppTexts.appName,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: 100),
        Text(
          STAppTexts.tLoginTitle,
          style:GoogleFonts.beVietnamPro(
            fontSize: 32,
            fontWeight: FontWeight.bold,
                color: dark
                    ? Color.fromRGBO(255, 255, 255, 1)
                    : Color.fromRGBO(38, 28, 18, 1),
              ),
        ),
        const SizedBox(height: STAppSizes.spaceBtwItems),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "New here?",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: dark
                    ? Color.fromRGBO(255, 255, 255, 1)
                    : Color.fromRGBO(38, 28, 18, 0.3),
              ),
            ),
              SizedBox(width: 5),

GestureDetector(
  onTap: () {
    // Navigate to the Sign Up screen
    Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => const SignUpScreen(),
  ),
  (route) => false, 
);
  },
  child: Text(
                "Create account",
                style:TextStyle(
                  color:Color.fromRGBO(213, 113, 91, 1) ,
                ),
              ),
),
          ],
        ),
      ],
    );
  }
}
