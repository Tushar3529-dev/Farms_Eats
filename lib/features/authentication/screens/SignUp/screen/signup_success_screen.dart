import 'package:flutter/material.dart';
import 'package:software_lab/common/widgets/auth_button.dart';
import 'package:software_lab/features/home/screen/home_screen.dart';
import 'package:software_lab/utils/constants/image_string.dart';

class SignupSuccessScreen extends StatelessWidget {
  const SignupSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              const Spacer(),

             
              Image.asset(
              STAppImages.onSignUpSuccessTick, 
                height: 100,
              ),

              const SizedBox(height: 30),

              /// TITLE
              const Text(
                "You're all done!",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              /// DESCRIPTION
              const Text(
                "Hang tight! We are currently reviewing your account and will follow up with you in 2-3 business days. In the meantime, you can setup your inventory.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),

              const Spacer(),

              /// BUTTON
             
              AuthButton(
              width: double.infinity,
              onPressed: (){
                Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (_) => HomeScreen()),
  (route) => false,
);
              },
              color: Color.fromRGBO(213, 113, 91, 1),
              text: "Got it!",
            ),
            ],
          ),
        ),
      ),
    );
  }
}