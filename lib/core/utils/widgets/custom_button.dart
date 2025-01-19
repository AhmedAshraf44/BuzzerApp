import 'package:buzzer_app/constants.dart';
import 'package:flutter/material.dart';

import '../app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
  });

  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 286,
        height: 48,
        decoration: BoxDecoration(
          color: kButtonColor,
          borderRadius: BorderRadius.circular(20),
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
