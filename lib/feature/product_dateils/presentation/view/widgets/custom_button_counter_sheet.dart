import 'package:flutter/material.dart';

class CustomButtonCounterSheet extends StatelessWidget {
  const CustomButtonCounterSheet({
    super.key,
    required this.icon,
    required this.borderColor,
    this.iconColor,
    this.onTap,
    required this.containerColor,
  });
  final IconData icon;
  final Color borderColor;
  final Color? iconColor;
  final Color containerColor;

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: containerColor,
          border: Border.all(color: borderColor),
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: 30,
        ),
      ),
    );
  }
}
