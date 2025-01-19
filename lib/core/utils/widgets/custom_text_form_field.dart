import 'package:buzzer_app/constants.dart';
import 'package:flutter/material.dart';

import '../app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.validator,
    this.keyboardType,
    this.controller,
    this.suffixIcon,
    this.obscureText,
    this.initialValue,
    this.enabled,
  });
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool? obscureText;
  final String? initialValue;
  final bool? enabled;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      style: AppStyles.textStyle16Regular.copyWith(color: kTextColor),
      initialValue: initialValue,
      obscureText: obscureText ?? false,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: AppStyles.textStyle16Regular.copyWith(color: kTextColor),
      ),
    );
  }
}
