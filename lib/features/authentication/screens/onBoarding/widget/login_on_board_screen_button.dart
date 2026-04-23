import 'package:flutter/material.dart';
import 'package:software_lab/features/authentication/screens/Login/login_screen.dart';
import 'package:software_lab/utils/constants/colors.dart';
import 'package:software_lab/utils/helpers/helper_function.dart';

class LoginOnBoardScreenButton extends StatelessWidget {
  const LoginOnBoardScreenButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
     final dark = STHelperFunction.isDarkMode(context);
    return TextButton(
      onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
      },
      child: Text("Login",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: dark ? STAppColors.light : STAppColors.dark,),),
    );
  }
}