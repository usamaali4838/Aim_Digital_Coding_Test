
import 'package:aim_digital_coding_test/Utils/textstyle_utils.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.iconPath,
    required this.labelText,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final String iconPath;
  final String labelText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Image.asset(
          iconPath,
          color: Colors.white,
        ),
        prefixIconConstraints: const BoxConstraints(
          maxHeight: 20,
          maxWidth: 20,
        ),
        labelText: ' $labelText',
        enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        disabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        labelStyle: TextStyleUtil.sfMediumTextStyle(
          color: Colors.white,
        ),
        contentPadding: const EdgeInsets.only(bottom: 8),
      ),
      cursorColor: Colors.white,
      style: TextStyleUtil.sfMediumTextStyle(
        color: Colors.white,
      ),
      obscureText: obscureText,
    );
  }
}