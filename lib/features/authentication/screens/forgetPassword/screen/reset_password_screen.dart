import 'package:flutter/material.dart';
import 'package:software_lab/common/styles/spacing_style.dart';
import 'package:software_lab/features/authentication/screens/forgetPassword/widget/forget_header.dart';
import 'package:software_lab/features/authentication/screens/forgetPassword/widget/reset_password_form.dart';
import 'package:software_lab/utils/constants/text_string.dart';


class ResetPasswordScreen extends StatelessWidget {
  final String otp;
  const ResetPasswordScreen({super.key, required this.otp});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: STSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              STForgetHeader(
                title: "Reset Password",
              ),

              STResetPasswordForm(otp:otp),
            ],
          ),
        ),
      ),
    );
  }
}