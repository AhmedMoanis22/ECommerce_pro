import 'package:flutter/material.dart';

class CustomButtomAuth extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final Color buttoncolor;
  final Color textcolor;
  final double? width;

  const CustomButtomAuth(
      {super.key,
      this.width,
      required this.title,
      this.onPressed,
      required this.buttoncolor,
      required this.textcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(20),
        color: buttoncolor,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(color: textcolor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
