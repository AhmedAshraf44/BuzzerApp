import 'package:buzzer_app/core/utils/widgets/custom_rating.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../layout/data/model/restaurant_model/restaurant.dart';
import '../../../../../core/utils/app_styles.dart';

class CustomHomeItemDetails extends StatelessWidget {
  const CustomHomeItemDetails({
    super.key,
    required this.restaurants,
  });

  final Restaurant restaurants;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomRating(
            size: 13,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            restaurants.name!,
            style: AppStyles.textStyle16Bold.copyWith(
              color: Colors.black,
            ),
          ),
          Text(
            restaurants.type!,
            style: AppStyles.textStyle14Regular.copyWith(
              color: Color(0xffEC362B),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: kPrimaryColor,
                size: 14,
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(
                  restaurants.address!,
                  maxLines: 2,
                  style: AppStyles.textStyle12Regular.copyWith(
                    color: Colors.black.withValues(alpha: .5),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
