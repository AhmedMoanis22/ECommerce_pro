import 'package:flutter/material.dart';

class CustomForTextAuth extends StatelessWidget {
  final String title;
  final IconData prefixIcon;
  final String description;
  final String Function(String?)? valid;
  final TextEditingController? controller;
  final TextInputType? keyboard;
  final bool? obsecure;
  final Widget? suffixIcon;

  const CustomForTextAuth({
    super.key,
    required this.title,
    required this.prefixIcon,
    this.controller,
    required this.description,
    this.valid,
    this.keyboard,
    this.obsecure,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecure ?? false,
      keyboardType: keyboard,
      validator: valid,
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: description,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          label: Text(title),
          floatingLabelBehavior: FloatingLabelBehavior.always),
    );
  }
}
