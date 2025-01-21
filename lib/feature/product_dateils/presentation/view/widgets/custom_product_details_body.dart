import 'package:buzzer_app/feature/product_dateils/presentation/view/widgets/custom_customer_review.dart';
import 'package:buzzer_app/feature/product_dateils/presentation/view/widgets/custom_description.dart';
import 'package:buzzer_app/feature/product_dateils/presentation/view/widgets/custom_product_details_image_and_price.dart';
import 'package:buzzer_app/feature/product_dateils/presentation/view/widgets/custom_supplier.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/widgets/my_divider.dart';
import '../../../../layout/data/model/restaurant_model/product.dart';

class CustomProductDetailsBody extends StatelessWidget {
  const CustomProductDetailsBody({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 17),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomProductDetailsImageAndPrice(
              product: product,
            ),
            MyDivider(),
            CustomSupplier(
              product: product,
            ),
            MyDivider(),
            CustomDescription(
              product: product,
            ),
            MyDivider(),
            CustomCustomerReview(
              product: product,
            ),
          ],
        ),
      ),
    );
  }
}
