import 'package:buzzer_app/feature/cart/presentation/view/widgets/custom_cart_design_item.dart';
import 'package:buzzer_app/feature/cart/presentation/view/widgets/custom_row_cart_item_info.dart';
import 'package:buzzer_app/feature/cart/presentation/view/widgets/cutsom_cart_price_details.dart';
import 'package:flutter/material.dart';

class CustomCartItem extends StatelessWidget {
  const CustomCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCartDesignItem(
      widget: Column(
        children: [
          CustomRowCartItemInfo(),
          SizedBox(
            height: 12,
          ),
          CutsomCartPriceDetails(
            tittle: 'Price:',
            price: 'SAR 300',
          ),
          CutsomCartPriceDetails(
            tittle: 'Quantity:',
            price: '×2',
          ),
          CutsomCartPriceDetails(
            tittle: 'Subtotal:',
            price: 'SAR 600',
          ),
        ],
      ),
    );
  }
}
