import 'package:flutter/material.dart';
import 'package:software_lab/features/authentication/screens/SignUp/screen/sign_up_screen.dart';

class JoinTheMovementButton extends StatelessWidget {
  final Color color;
  const JoinTheMovementButton({
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
      },
      child: Container(
      width: 236,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(child: Text("Join the movement!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),)),
      ),
    );
  }
}
