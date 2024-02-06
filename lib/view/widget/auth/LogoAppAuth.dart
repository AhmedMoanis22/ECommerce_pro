import 'package:flutter/material.dart';

class LogoAppAuth extends StatelessWidget {
  const LogoAppAuth(
      {super.key,
      required this.image,
      required this.width,
      required this.height});

  final String image;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: width,
      height: height,
    );
  }
}
