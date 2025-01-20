import 'package:buzzer_app/core/function/build_app_bar.dart';
import 'package:buzzer_app/feature/product_dateils/presentation/view/widgets/custom_product_details_body.dart';
import 'package:flutter/material.dart';
import 'widgets/build_bottom_sheet.dart';

class ProductDetialsView extends StatelessWidget {
  const ProductDetialsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Product Detail', leadingWidth: 40),
      bottomSheet: BuildBottomSheet(),
      body: CustomProductDetailsBody(),
    );
  }
}
