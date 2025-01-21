import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

class CustomProfileInfoItem extends StatelessWidget {
  const CustomProfileInfoItem({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.textStyle16Regular.copyWith(
            color: Color(0xff999999),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            subTitle,
            style: AppStyles.textStyle16Regular.copyWith(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
