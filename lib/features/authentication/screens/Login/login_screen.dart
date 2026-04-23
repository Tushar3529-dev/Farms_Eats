import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'package:software_lab/common/styles/spacing_style.dart';
import 'package:software_lab/common/widgets/oAuth_button.dart';
import 'package:software_lab/features/authentication/screens/Login/widgets/login_divider.dart';
import 'package:software_lab/features/authentication/screens/Login/widgets/login_form.dart';
import 'package:software_lab/features/authentication/screens/Login/widgets/login_header.dart';
import 'package:software_lab/utils/constants/sizes.dart';
import 'package:software_lab/utils/constants/text_string.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: STSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //// Logo , Title & Sub-Title
              const STLoginHeader(),

              // Form
               STLoginForm(),

              // Divider
       STFormDivider(dividerText: STAppTexts.tOrSignInWith.capitalize!),

              const SizedBox(height: STAppSizes.spaceBtwSections),

              // Footer
              const STSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}