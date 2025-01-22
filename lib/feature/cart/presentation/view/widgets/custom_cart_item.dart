import 'package:buzzer_app/feature/cart/presentation/view/widgets/custom_cart_design_item.dart';
import 'package:buzzer_app/feature/cart/presentation/view/widgets/custom_row_cart_item_info.dart';
import 'package:buzzer_app/feature/cart/presentation/view/widgets/cutsom_cart_price_details.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/model/product.dart';

class CustomCartItem extends StatelessWidget {
  const CustomCartItem({
    super.key,
    required this.product,
    required this.index,
    required this.subTotal,
  });
  final Product product;
  final int index;
  final int subTotal;
  @override
  Widget build(BuildContext context) {
    return CustomCartDesignItem(
      widget: Column(
        children: [
          CustomRowCartItemInfo(
            product: product,
            index: index,
          ),
          SizedBox(
            height: 12,
          ),
          CutsomCartPriceDetails(
            tittle: 'Price:',
            price: 'SAR ${product.price}',
          ),
          CutsomCartPriceDetails(
            tittle: 'Quantity:',
            price: '×${product.quantity}',
          ),
          CutsomCartPriceDetails(
            tittle: 'Subtotal:',
            price: 'SAR $subTotal',
          ),
        ],
      ),
    );
  }
}
