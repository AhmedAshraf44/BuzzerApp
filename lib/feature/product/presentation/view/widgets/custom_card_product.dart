import 'package:buzzer_app/feature/product/presentation/view/widgets/custom_card_product_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../layout/data/model/restaurant_model/product.dart';

class CustomCardProduct extends StatelessWidget {
  const CustomCardProduct({
    super.key,
    required this.product,
  });
  final Product product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kProductDetialsView, extra: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CustomCardProductItem(
            product: product,
          ),
          Positioned(
            right: 30,
            bottom: 110,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                product.imageProduct!,
                height: 130,
                width: 130,
                //fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
