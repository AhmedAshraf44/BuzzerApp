import 'package:buzzer_app/feature/product_dateils/presentation/view/widgets/custom_supplier_item_details.dart';
import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../layout/data/model/restaurant_model/product.dart';

class CustomSupplier extends StatelessWidget {
  const CustomSupplier({
    super.key,
    required this.product,
  });
  final Product product;
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
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(150),
                topRight: Radius.circular(150),
              ),
              child: Image.network(
                product.imageRestaurant!,
                height: 85,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 19,
            ),
            CustomSupplierItemDetails(
              product: product,
            ),
          ],
        ),
      ],
    );
  }
}
