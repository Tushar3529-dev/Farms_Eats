import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:software_lab/common/styles/spacing_style.dart';
import 'package:software_lab/features/authentication/screens/SignUp/widget/sign_up_header.dart';
import 'package:software_lab/features/authentication/screens/SignUp/widget/sigup_form1.dart';
import 'package:software_lab/features/authentication/screens/forgetPassword/widget/forget_header.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: STSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              STSignupHeader(
                title: "Welcome!",
                currentStep: 1,
              ),

              STSignupForm(),
            ],
          ),
        ),
      ),
    );
  }
}