import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/widgets/custom_rating.dart';
import '../../../../../core/utils/model/product.dart';

class CustomCardProductItem extends StatelessWidget {
  const CustomCardProductItem({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                CustomRating(
                  size: 13,
                ),
                const Spacer(),
                Text(
                  'Featured',
                  style: AppStyles.textStyle12Bold.copyWith(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Butter Sandwich',
              style: AppStyles.textStyle14Bold.copyWith(
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              product.place!,
              style: AppStyles.textStyle12Regular.copyWith(
                color: Colors.black.withValues(alpha: .5),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  product.type!,
                  style: AppStyles.textStyle12Regular.copyWith(
                    color: Color(0xffEC362B),
                  ),
                ),
                Spacer(),
                Text(
                  'SAR ${product.discountPrice.toString()}',
                  style: AppStyles.textStyle12Regular.copyWith(
                      color: Color(0xff8B8B8B),
                      decoration: TextDecoration.lineThrough),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'SAR ${product.price.toString()}',
                  style: AppStyles.textStyle14Bold.copyWith(
                    color: kSecondaryColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
