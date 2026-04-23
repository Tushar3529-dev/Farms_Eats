import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:software_lab/common/widgets/auth_button.dart';
import 'package:software_lab/common/widgets/top_bar.dart';
import 'package:software_lab/features/authentication/screens/forgetPassword/data/model/forget_password_model.dart';
import 'package:software_lab/features/authentication/screens/forgetPassword/data/service/forget_password_api_service.dart';
import 'package:software_lab/features/authentication/screens/forgetPassword/screen/verify_otp_screen.dart';
import 'package:software_lab/utils/constants/sizes.dart';
import 'package:software_lab/utils/constants/text_string.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class STForgetPasswordForm extends StatefulWidget {
 
  const STForgetPasswordForm({super.key, });

  @override
  State<STForgetPasswordForm> createState() => _STForgetPasswordFormState();
}

class _STForgetPasswordFormState extends State<STForgetPasswordForm> {
  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: STAppSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.phone,
              controller: phoneController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.phone_outlined),
                labelText: STAppTexts.tPhoneNumber,
              ),
            ),
           
           
            
            const SizedBox(height: STAppSizes.spaceBtwItems),
            // Create Account Button
           AuthButton(
  width: double.infinity,
  color: const Color.fromRGBO(213, 113, 91, 1),
  text: STAppTexts.sendCode,
  onPressed: () async {
    final phone = phoneController.text.trim();

    if (phone.isEmpty) {
      showTopSnackBar(
      Overlay.of(context),
      const CustomSnackBar.error(
        message: "Enter phone number",
      ),
    );
      
      return;
    }

    final api = ForgetPasswordApiService();

    try {
      final response = await api.sendOtp(
        ForgetPasswordModel(mobile: phone),
      );

      
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.success(
      message: response["message"],
    ),
  );
      
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VerifyOtpScreen(
            // optional pass
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
  },
),
          ],
        ),
      ),
    );;
  }
}