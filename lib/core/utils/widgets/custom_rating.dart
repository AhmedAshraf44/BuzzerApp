import 'package:flutter/material.dart';

import '../../../constants.dart';

class CustomRating extends StatelessWidget {
  const CustomRating({
    super.key,
    required this.size,
  });
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: kButtonColor,
          size: size,
        ),
        Icon(
          Icons.star,
          color: kButtonColor,
          size: size,
        ),
        Icon(
          Icons.star,
          color: kButtonColor,
          size: size,
        ),
        Icon(
          Icons.star,
          color: kButtonColor,
          size: size,
        ),
        Icon(
          Icons.star,
          color: Color(0xffCCCCCC),
          size: size,
        ),
      ],
    );
  }
}
