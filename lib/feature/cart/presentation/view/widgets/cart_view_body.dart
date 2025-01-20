import 'package:buzzer_app/feature/cart/presentation/view/widgets/build_order_summary.dart';
import 'package:buzzer_app/feature/cart/presentation/view/widgets/custom_cart_item.dart';
import 'package:flutter/material.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(top: 22),
            child: CustomCartItem(),
          ),
        ),
        SizedBox(
          height: 17,
        ),
        BuildOrderSummary(),
      ],
    );
  }
}
