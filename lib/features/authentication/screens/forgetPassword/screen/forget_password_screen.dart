import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:software_lab/common/styles/spacing_style.dart';
import 'package:software_lab/features/authentication/screens/forgetPassword/widget/forget_form.dart';
import 'package:software_lab/features/authentication/screens/forgetPassword/widget/forget_header.dart';
import 'package:software_lab/utils/constants/text_string.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: STSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //// Logo , Title & Sub-Title
              const STForgetHeader(
                title:STAppTexts.tForgetPassword,
              ),

              // Form
              const STForgetPasswordForm(),


            ],
          ),
        ),
      ),
    );
  }
}