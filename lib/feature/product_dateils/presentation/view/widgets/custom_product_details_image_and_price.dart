import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/widgets/custom_rating.dart';
import '../../../../layout/data/model/restaurant_model/product.dart';

class CustomProductDetailsImageAndPrice extends StatelessWidget {
  const CustomProductDetailsImageAndPrice({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height / 3,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                product.imageProduct!,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        CustomRating(
          size: 20,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          product.nameProduct!,
          style: AppStyles.textStyle18Bold.copyWith(color: Colors.black),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text(
              'SAR ${product.price}',
              style: AppStyles.textStyle16Bold.copyWith(
                color: kSecondaryColor,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'SAR ${product.discountPrice}',
              style: AppStyles.textStyle12Regular.copyWith(
                color: Color(0xff8B8B8B),
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
