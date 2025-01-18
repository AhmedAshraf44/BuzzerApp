import 'package:buzzer_app/constants.dart';
import 'package:flutter/material.dart';

import '../app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.validator,
    this.keyboardType,
    this.controller,
    this.suffixIcon,
  });
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: AppStyles.textStyle18Regular.copyWith(color: kTextColor),
      ),
    );
  }
}
