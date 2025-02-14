import 'package:buzzer_app/core/function/build_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/model/product.dart';
import 'widgets/custom_card_product.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.products});
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Supplier Products', leadingWidth: 40),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 25,
          left: 25,
          top: 100,
        ),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            childAspectRatio: 1,
            mainAxisSpacing: 75,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: CustomCardProduct(product: products[index]),
            );
          },
        ),
      ),
    );
  }
}
