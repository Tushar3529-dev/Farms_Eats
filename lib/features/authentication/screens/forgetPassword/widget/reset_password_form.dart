import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:software_lab/common/widgets/auth_button.dart';
import 'package:software_lab/common/widgets/top_bar.dart';
import 'package:software_lab/features/authentication/screens/Login/login_screen.dart';
import 'package:software_lab/features/authentication/screens/forgetPassword/data/model/reset_password_model.dart';
import 'package:software_lab/features/authentication/screens/forgetPassword/data/service/forget_password_api_service.dart';
import 'package:software_lab/utils/constants/sizes.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class STResetPasswordForm extends StatefulWidget {
  final String otp;
  const STResetPasswordForm({super.key,required this.otp});

  @override
  State<STResetPasswordForm> createState() => _STResetPasswordFormState();
}

class _STResetPasswordFormState extends State<STResetPasswordForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: STAppSizes.spaceBtwSections),
        child: Column(
          children: [
            /// NEW PASSWORD
            TextFormField(
              controller: passwordController,
              obscureText: obscurePassword,
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.lock),
               labelText: "New Password",
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    obscurePassword ? Iconsax.eye_slash : Iconsax.eye,
                  ),
                  onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter password";
                }
                if (value.length < 6) {
                  return "Password must be at least 6 characters";
                }
                return null;
              },
            ),

            const SizedBox(height: 20),

            /// CONFIRM PASSWORD
            TextFormField(
              controller: confirmPasswordController,
              obscureText: obscureConfirmPassword,
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.lock),
                labelText: "Confirm New Password",
            
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    obscureConfirmPassword ? Iconsax.eye_slash : Iconsax.eye,
                  ),
                  onPressed: () {
                    setState(() {
                      obscureConfirmPassword = !obscureConfirmPassword;
                    });
                  },
                ),
              ),
              validator: (value) {
                if (value != passwordController.text) {
                  return "Passwords do not match";
                }
                return null;
              },
            ),

            const SizedBox(height: 30),

            /// SUBMIT BUTTON
            AuthButton(
              width: double.infinity,
              color: const Color.fromRGBO(213, 113, 91, 1),
              text: "Submit",
             onPressed: () async {
  if (_formKey.currentState!.validate()) {
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    final api = ForgetPasswordApiService();

    try {
      final response = await api.resetPassword(
        ResetPasswordModel(
          token: widget.otp, 
          password: password,
          cpassword: confirmPassword,
        ),
      );

    
showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.success(
      message: response["message"],
    ),
  );
   
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => LoginScreen()),
        (route) => false,
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
},
            ),
          ],
        ),
      ),
    );
  }
}