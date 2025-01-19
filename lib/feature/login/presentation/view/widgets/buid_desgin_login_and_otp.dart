import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class BuidDesginLoginAndOtp extends StatelessWidget {
  const BuidDesginLoginAndOtp({
    super.key,
    required this.widget,
  });

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(150),
      ),
      child: Container(
        height: MediaQuery.sizeOf(context).height / 2,
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
