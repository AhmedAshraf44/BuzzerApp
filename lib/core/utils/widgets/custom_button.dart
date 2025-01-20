import 'package:buzzer_app/constants.dart';
import 'package:flutter/material.dart';

import '../app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.width,
    this.buttonColor,
    this.borderColor,
  });

  final String text;
  final void Function()? onTap;
  final double? width;
  final Color? buttonColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? 286,
        height: 48,
        decoration: BoxDecoration(
          color: buttonColor ?? kButtonColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: borderColor ?? kButtonColor),
        ),
        child: Center(
          child: Text(
            text.toUpperCase(),
            style: AppStyles.textStyle16Bold.copyWith(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
