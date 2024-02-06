import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key,required this.onPressed});
  final  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
          onPressed:onPressed,
          child: Text(
            "Delete All",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.redAccent[700],
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        );
  }
}
