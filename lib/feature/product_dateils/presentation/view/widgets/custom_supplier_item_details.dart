import 'package:buzzer_app/core/utils/widgets/custom_rating.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../layout/data/model/restaurant_model/product.dart';

class CustomSupplierItemDetails extends StatelessWidget {
  const CustomSupplierItemDetails({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomRating(
          size: 12,
        ),
        SizedBox(
          height: 3,
        ),
        Text(
          product.name!,
          style: AppStyles.textStyle16Bold.copyWith(
            color: Colors.black,
          ),
        ),
        Text(
          product.type!,
          style: AppStyles.textStyle12Regular.copyWith(
            color: Color(0xffEC362B),
          ),
        ),
        SizedBox(
          height: 3,
        ),
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: kPrimaryColor,
              size: 12,
            ),
            SizedBox(
              width: 3,
            ),
            Text(
              product.address!,
              style: AppStyles.textStyle12Regular.copyWith(
                fontSize: 10,
                color: Colors.black.withValues(alpha: .5),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
