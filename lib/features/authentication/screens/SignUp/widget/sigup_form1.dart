import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:software_lab/common/widgets/auth_button.dart';
import 'package:software_lab/common/widgets/oAuth_button.dart';
import 'package:software_lab/features/authentication/screens/Login/login_screen.dart';
import 'package:software_lab/features/authentication/screens/Login/widgets/login_divider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:software_lab/features/authentication/screens/SignUp/screen/farm_info_screen.dart';
import 'package:software_lab/utils/constants/sizes.dart';
import 'package:software_lab/utils/helpers/helper_function.dart';

class STSignupForm extends StatefulWidget {
  const STSignupForm({super.key});

  @override
  State<STSignupForm> createState() => _STSignupFormState();
}

class _STSignupFormState extends State<STSignupForm> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     final dark = STHelperFunction.isDarkMode(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          /// SOCIAL LOGIN
          const STSocialButtons(),

          const SizedBox(height: 20),

          /// DIVIDER
          const STFormDivider(dividerText: "or signup with"),

          const SizedBox(height: 20),

          /// FULL NAME
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Iconsax.user),
             /*  hintText: "Full Name", */
              labelText: "Full Name",
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            validator: (value) =>
                value!.isEmpty ? "Enter your name" : null,
          ),

          const SizedBox(height: 15),

          /// EMAIL
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Iconsax.sms),
              /* hintText: "Email", */
              labelText: "Email",
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter email";
              }
              if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                return "Enter valid email";
              }
              return null;
            },
          ),

          const SizedBox(height: 15),

          /// PHONE
          TextFormField(
            controller: phoneController,
      
            decoration: InputDecoration(
              prefixIcon: const Icon(Iconsax.call),
              /* hintText: "Phone Number", */
              labelText: "Phone Number",
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter phone number";
              }
              if (value.length < 10) {
                return "Invalid phone number";
              }
              return null;
            },
          ),

          const SizedBox(height: 15),

          /// PASSWORD
          TextFormField(
            controller: passwordController,
            obscureText: obscurePassword,
            decoration: InputDecoration(
              prefixIcon: const Icon(Iconsax.lock),
             /*  hintText: "Password", */
              labelText: "Password",
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                    obscurePassword ? Iconsax.eye_slash : Iconsax.eye),
                onPressed: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
              ),
            ),
            validator: (value) {
              if (value == null || value.length < 6) {
                return "Min 6 characters required";
              }
              return null;
            },
          ),

          const SizedBox(height: 15),

          /// CONFIRM PASSWORD
          TextFormField(
            controller: confirmPasswordController,
            obscureText: obscureConfirmPassword,
            decoration: InputDecoration(
              prefixIcon: const Icon(Iconsax.lock),
              /*  hintText: "Confirm Password", */
              labelText: "Re-enter Password",
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                    obscureConfirmPassword
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                onPressed: () {
                  setState(() {
                    obscureConfirmPassword =
                        !obscureConfirmPassword;
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

          const SizedBox(height: 25),

          /// CONTINUE BUTTON
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              GestureDetector(
                onTap: () {
                 Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => const LoginScreen(),
  ),
  (route) => false, 
);
                },
                child:  Text(
                  "Login",

                  
                  style: GoogleFonts.beVietnamPro(
                    fontSize:14 ,
                    decoration: TextDecoration.underline,
                    color: dark
                    ? Color.fromRGBO(255, 255, 255, 1)
                    : Color.fromRGBO(38, 28, 18, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              AuthButton(
                /* width: double.infinity */
                color: const Color.fromRGBO(213, 113, 91, 1),
                text: "Continue",
               onPressed: () {
  if (_formKey.currentState!.validate()) {
    final data = {
      "name": nameController.text,
      "email": emailController.text,
      "phone": phoneController.text,
      "password": passwordController.text,
    };

    
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FarmInfoScreen(userData: data),
      ),
    );
  }
}
              ),
            ],
          ),
        ],
      ),
    );
  }
}