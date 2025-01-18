import 'package:buzzer_app/constants.dart';
import 'package:flutter/material.dart';

import '../app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.formKey,
    required this.text,
    this.onTap,
  });

  final GlobalKey<FormState> formKey;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 40,
        decoration: BoxDecoration(
          color: kButtonColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text.toUpperCase(),
            style: AppStyles.textStyle24SemiBold.copyWith(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
