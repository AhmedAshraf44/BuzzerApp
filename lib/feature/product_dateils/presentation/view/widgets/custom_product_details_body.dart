import 'package:buzzer_app/feature/product_dateils/presentation/view/widgets/custom_customer_review.dart';
import 'package:buzzer_app/feature/product_dateils/presentation/view/widgets/custom_description.dart';
import 'package:buzzer_app/feature/product_dateils/presentation/view/widgets/custom_product_details_image_and_price.dart';
import 'package:buzzer_app/feature/product_dateils/presentation/view/widgets/custom_supplier.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/widgets/my_divider.dart';

class CustomProductDetailsBody extends StatelessWidget {
  const CustomProductDetailsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 17),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomProductDetailsImageAndPrice(),
            MyDivider(),
            CustomSupplier(),
            MyDivider(),
            CustomDescription(),
            MyDivider(),
            CustomCustomerReview(),
          ],
        ),
      ),
    );
  }
}
