import 'package:buzzer_app/feature/cart/presentation/manger/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/widgets/my_divider.dart';
import 'custom_cart_design_item.dart';
import 'cutsom_cart_price_details.dart';

class BuildOrderSummary extends StatelessWidget {
  const BuildOrderSummary({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var cubit = CartCubit.get(context);
    return CustomCartDesignItem(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Summary',
            style: AppStyles.textStyle18Bold.copyWith(
              color: Colors.black,
            ),
          ),
          MyDivider(top: 5),
          CutsomCartPriceDetails(
            tittle: 'Subtotal:',
            price: 'SAR ${cubit.subTotal}',
          ),
          CutsomCartPriceDetails(
            tittle: 'VAT:',
            price: 'SAR 20',
          ),
          CutsomCartPriceDetails(
            tittle: 'total:',
            price: 'SAR ${cubit.subTotal + 20}',
            priceColor: Color(0xffEC362B),
          ),
        ],
      ),
    );
  }
}
