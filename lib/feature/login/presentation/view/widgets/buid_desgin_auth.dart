import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class BuidDesignAuth extends StatelessWidget {
  const BuidDesignAuth({
    super.key,
    required this.widget,
  });

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(220),
      ),
      child: Container(
        height: kDesignHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              kPrimaryColor,
              kSecondaryColor,
              kPrimaryColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20), child: widget),
      ),
    );
  }
}
