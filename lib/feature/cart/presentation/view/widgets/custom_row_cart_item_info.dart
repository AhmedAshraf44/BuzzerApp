import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/widgets/custom_rating.dart';

class CustomRowCartItemInfo extends StatelessWidget {
  const CustomRowCartItemInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: CircleAvatar(
            radius: 30,
            child: Image.asset(
              Assets.imagesProduct,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 23,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomRating(size: 12),
              Text(
                'Butter Sandwich',
                style: AppStyles.textStyle18Bold.copyWith(
                  color: Colors.black,
                ),
              ),
              Text(
                'View Details',
                style: AppStyles.textStyle12Regular.copyWith(
                  color: kButtonColor,
                  decorationColor: kButtonColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.delete,
            color: Color(0xffEC362B),
          ),
        ),
      ],
    );
  }
}
