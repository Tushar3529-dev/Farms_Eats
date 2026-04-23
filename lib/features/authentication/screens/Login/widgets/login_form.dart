
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:software_lab/common/widgets/auth_button.dart';
import 'package:software_lab/common/widgets/top_bar.dart';
import 'package:software_lab/features/authentication/screens/Login/data/model/login_model.dart';
import 'package:software_lab/features/authentication/screens/Login/data/services/login_api_service.dart';
import 'package:software_lab/features/authentication/screens/forgetPassword/screen/forget_password_screen.dart';
import 'package:software_lab/features/home/screen/home_screen.dart';
import 'package:software_lab/utils/constants/sizes.dart';
import 'package:software_lab/utils/constants/text_string.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class STLoginForm extends StatefulWidget {

   STLoginForm({super.key

    });

  @override
  State<STLoginForm> createState() => _STLoginFormState();
}

class _STLoginFormState extends State<STLoginForm> {
  final emailController = TextEditingController();
bool isPasswordHidden = true;
final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: STAppSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
                controller: emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.alternate_email_sharp),
                labelText: STAppTexts.email,
              ),
            ),
            const SizedBox(height: STAppSizes.spaceBtwInputFields),
            TextFormField(
              obscureText: isPasswordHidden,
              controller: passwordController,
              decoration:  InputDecoration(
                prefixIcon: Icon(Iconsax.lock),
                labelText: STAppTexts.password,

                suffixIcon: IconButton(
      icon: Icon(
        isPasswordHidden ? Iconsax.eye_slash : Iconsax.eye,
      ),
      onPressed: () {
        setState(() {
          isPasswordHidden = !isPasswordHidden;
        });
      },
    ),
              ),
            ),
            const SizedBox(height: STAppSizes.spaceBtwInputFields / 2),

            // Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Remember Me
             
                // Forget Password
                TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgetPasswordScreen()));
                  },
                  child: const Text(STAppTexts.tForgetPassword, style: TextStyle(
                    color: Color.fromRGBO(213, 113, 91, 1),
                  )),
                ),
              ],
            ),
          /*   const SizedBox(height: STAppSizes.spaceBtwSections), */

            // Sign In Button
          /*   SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(const NavigationMenu()),
                child: const Text(STAppTexts.tSignin),
              ),
            ), */
            const SizedBox(height: STAppSizes.spaceBtwItems),
            // Create Account Button
           AuthButton(
  color: const Color.fromRGBO(213, 113, 91, 1),
  text: STAppTexts.tLogin,
  onPressed: () async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
    
       showTopSnackBar(
      Overlay.of(context),
      const CustomSnackBar.error(
        message: "Email & Password required",
      ),
    );
      return;
    }

    final api = LoginApiService();

    try {
      final response = await api.loginUser(
        LoginModel(email: email, password: password),
      );
  final prefs = await SharedPreferences.getInstance();

  await prefs.setString(
    "name",
    response["user"]["full_name"],
  );

  await prefs.setString(
    "email",
    response["user"]["email"],
  );
      
 showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.success(
      message: response["message"],
    ),
  );
      
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
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
  },
)
          ],
        ),
      ),
    );
  }
}
