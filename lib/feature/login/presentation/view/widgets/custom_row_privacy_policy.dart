import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_styles.dart';

class CustomRowPrivacyPolicy extends StatelessWidget {
  const CustomRowPrivacyPolicy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            'By tapping next you agree to ',
            style: AppStyles.textStyle18Regular.copyWith(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          Text(
            'T&C ',
            style: AppStyles.textStyle18Regular.copyWith(
              color: kFeaturedTextColor,
              fontSize: 15,
            ),
          ),
          Text(
            'and ',
            style: AppStyles.textStyle18Regular.copyWith(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          Text(
            'Privacy Policy',
            style: AppStyles.textStyle18Regular.copyWith(
              color: kFeaturedTextColor,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
