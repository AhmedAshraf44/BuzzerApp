import 'package:buzzer_app/core/utils/widgets/custom_rating.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../app_styles.dart';

class CustomHomeAndSupplierItemDetails extends StatelessWidget {
  const CustomHomeAndSupplierItemDetails({
    super.key,
    this.hightSizedBox,
    this.iconSize,
    this.fontSizeAddres,
    this.fontSizeRestaurant,
  });
  final double? hightSizedBox;
  final double? iconSize;
  final double? fontSizeAddres;
  final double? fontSizeRestaurant;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomRating(
          size: 12,
        ),
        SizedBox(
          height: hightSizedBox ?? 8,
        ),
        Text(
          'The Skye',
          style: AppStyles.textStyle16Bold.copyWith(
            color: Colors.black,
          ),
        ),
        Text(
          'Restaurant',
          style: AppStyles.textStyle14Regular.copyWith(
            color: Color(0xffEC362B),
            fontSize: fontSizeRestaurant,
          ),
        ),
        SizedBox(
          height: hightSizedBox ?? 8,
        ),
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: kPrimaryColor,
              size: iconSize ?? 14,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Main Market Riyadh, KSA',
              style: AppStyles.textStyle12Regular.copyWith(
                fontSize: fontSizeAddres,
                color: Colors.black.withValues(alpha: .5),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
