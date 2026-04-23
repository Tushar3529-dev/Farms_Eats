import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback? onPressed;
  final double ?width;
  final double? height;
  const AuthButton({super.key, required this.color, required this.text, this.onPressed, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onPressed,
      child: Container(
      width: width ?? 330,
      height: height ?? 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(child: Text(text, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),)),
      ),
    );
  }
}