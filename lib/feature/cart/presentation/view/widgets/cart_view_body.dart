import 'package:buzzer_app/feature/cart/presentation/manger/cubit/cart_cubit.dart';
import 'package:buzzer_app/feature/cart/presentation/view/widgets/build_order_summary.dart';
import 'package:buzzer_app/feature/cart/presentation/view/widgets/custom_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({
    super.key,
    required this.cubit,
  });
  final CartCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: cubit.model!.products!.length,
                itemBuilder: (context, index) {
                  int subTotal = cubit.model!.products![index].price!.toInt() *
                      cubit.model!.products![index].quantity!.toInt();
                  print("subTotal: $subTotal");
                  cubit.getSubTolal(subTotal);
                  return Padding(
                    padding: const EdgeInsets.only(top: 22),
                    child: CustomCartItem(
                        product: cubit.model!.products![index],
                        index: index,
                        subTotal: subTotal),
                  );
                });
          },
        ),
        SizedBox(
          height: 17,
        ),
        BuildOrderSummary(),
      ],
    );
  }
}
