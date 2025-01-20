import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/widgets/custom_rating.dart';

class CustomCustomer extends StatelessWidget {
  const CustomCustomer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(Assets.imagesPdImage),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Linda',
                style: AppStyles.textStyle16Bold.copyWith(
                  color: Colors.black,
                ),
              ),
              Text(
                'Jun 28,2021',
                style: AppStyles.textStyle16Regular.copyWith(
                  color: Colors.black.withValues(alpha: .5),
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        CustomRating(size: 12),
      ],
    );
  }
}
