import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:software_lab/utils/constants/sizes.dart';
import 'package:software_lab/utils/constants/text_string.dart';
import 'package:software_lab/utils/helpers/helper_function.dart';

class STSignupHeader extends StatelessWidget {
  final String title;
  final int currentStep; // 1 to 4
  final int totalSteps;

  const STSignupHeader({
    super.key,
    required this.title,
    required this.currentStep,
    this.totalSteps = 4,
  });

  @override
  Widget build(BuildContext context) {
    final dark = STHelperFunction.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// APP NAME
        Text(
          STAppTexts.appName,
          style: Theme.of(context).textTheme.headlineMedium,
        ),

        const SizedBox(height: 40),

        /// STEP INDICATOR (Signup 1 of 4)
        Text(
          "Signup $currentStep of $totalSteps",
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: dark
                    ? Colors.white70
                    : const Color.fromRGBO(38, 28, 18, 0.5),
              ),
        ),

        const SizedBox(height: 10),

        /// TITLE (Welcome!, Business Info, etc.)
        Text(
          title,
          style: GoogleFonts.beVietnamPro(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: dark
                ? const Color.fromRGBO(255, 255, 255, 1)
                : const Color.fromRGBO(38, 28, 18, 1),
          ),
        ),

        const SizedBox(height: STAppSizes.spaceBtwItems),

        /// LOGIN ROW
        /* Row(
          children: [
            Text(
              "Already have an account?",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: dark
                        ? Colors.white
                        : const Color.fromRGBO(38, 28, 18, 0.3),
                  ),
            ),
            const SizedBox(width: 5),
            GestureDetector(
              onTap: () {
                Navigator.pop(context); // go to login
              },
              child: const Text(
                "Login",
                style: TextStyle(
                  color: Color.fromRGBO(213, 113, 91, 1),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ), */
      ],
    );
  }
}