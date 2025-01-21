import 'package:buzzer_app/core/function/build_app_bar.dart';
import 'package:buzzer_app/feature/layout/data/model/restaurant_model/product.dart';
import 'package:buzzer_app/feature/product_dateils/presentation/view/widgets/custom_product_details_body.dart';
import 'package:flutter/material.dart';
import 'widgets/build_bottom_sheet.dart';

class ProductDetialsView extends StatelessWidget {
  const ProductDetialsView({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Product Detail', leadingWidth: 40),
      bottomSheet: BuildBottomSheet(
        product: product,
      ),
      body: CustomProductDetailsBody(
        product: product,
      ),
    );
  }
}
