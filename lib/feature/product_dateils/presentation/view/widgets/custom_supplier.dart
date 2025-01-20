import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/widgets/custom_home_and_supplier_item_details.dart';

class CustomSupplier extends StatelessWidget {
  const CustomSupplier({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Supplier',
              style: AppStyles.textStyle18Bold.copyWith(
                color: Colors.black,
              ),
            ),
            Spacer(),
            Text(
              'Rate Supplier',
              style: AppStyles.textStyle14Regular.copyWith(
                color: kButtonColor,
                decorationColor: kButtonColor,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Image.asset(
              Assets.imagesTest,
              height: 85,
            ),
            SizedBox(
              width: 19,
            ),
            CustomHomeAndSupplierItemDetails(
              hightSizedBox: 3,
              iconSize: 12,
              fontSizeAddres: 10,
              fontSizeRestaurant: 12,
            ),
          ],
        ),
      ],
    );
  }
}
