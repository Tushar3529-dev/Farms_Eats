import 'package:flutter/material.dart';
import 'package:software_lab/common/widgets/auth_button.dart';
import 'package:software_lab/common/widgets/top_bar.dart';
import 'package:software_lab/features/authentication/screens/forgetPassword/data/model/verify_otp_model.dart';
import 'package:software_lab/features/authentication/screens/forgetPassword/data/service/forget_password_api_service.dart';
import 'package:software_lab/features/authentication/screens/forgetPassword/screen/reset_password_screen.dart';

import 'package:software_lab/features/authentication/screens/forgetPassword/widget/forget_header.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final int otpLength = 6;

  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();

    controllers =
        List.generate(otpLength, (_) => TextEditingController());
    focusNodes = List.generate(otpLength, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void onChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < otpLength - 1) {
        focusNodes[index + 1].requestFocus();
      }
    } else {
      if (index > 0) {
        focusNodes[index - 1].requestFocus();
      }
    }
  }

  String getOtp() {
    return controllers.map((e) => e.text).join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// HEADER
            const STForgetHeader(title: "Verify OTP"),

            const SizedBox(height: 40),

            /// OTP BOXES
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(otpLength, (index) {
                return SizedBox(
                  width: 60,
                  height: 60,
                  child: TextField(
                    controller: controllers[index],
                    focusNode: focusNodes[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      counterText: "",
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) => onChanged(value, index),
                  ),
                );
              }),
            ),

            const SizedBox(height: 30),

            /// SUBMIT BUTTON
            AuthButton(
              width: double.infinity,
              color: const Color.fromRGBO(213, 113, 91, 1),
              text: "Submit",
              onPressed: () async {
  final otp = getOtp();

  if (otp.length != 6) {
    showTopSnackBar(
      Overlay.of(context),
      const CustomSnackBar.error(
        message: "Enter valid 6-digit OTP",
      ),
    );
    return;
  }

  final api = ForgetPasswordApiService();

  try {
    final response = await api.verifyOtp(
      VerifyOtpModel(otp: otp),
    );
 showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: response["message"], // SUCCESS MESSAGE
      ));
   
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) =>  ResetPasswordScreen(
          otp:otp
        ),
      ),
    );
   

  } catch (e) {
  

    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: e.toString().replaceFirst("Exception: ", ""),
      ),
    );
  }
}
            ),

            const SizedBox(height: 15),

            /// RESEND
            Center(
              child: GestureDetector(
                onTap: () {},
                child: const Text(
                  "Resend Code",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}