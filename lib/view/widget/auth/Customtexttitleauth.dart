import 'package:flutter/material.dart';

class CustomTextTitleAuth extends StatelessWidget {
  final String Title;
  final Color? ColorLine;
  final TextStyle textStyle;
  const CustomTextTitleAuth(
      {super.key,
      required this.Title,
      this.ColorLine,
      required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        "$Title",
        textAlign: TextAlign.center,
        style: textStyle.copyWith(color: ColorLine),
      ),
    );
  }
}
