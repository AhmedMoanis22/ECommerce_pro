import 'package:flutter/material.dart';
import 'package:ecommerce_pro/core/colors/color.dart';

class TextSignUp extends StatelessWidget {
  final String textone;
  final String texttwo;
  const TextSignUp({super.key, required this.textone, required this.texttwo});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textone,
        ),
        Text(
          '$texttwo',
          style: const TextStyle(
            color: appcolors.puplecolor,
          ),
        ),
      ],
    );
  }
}
