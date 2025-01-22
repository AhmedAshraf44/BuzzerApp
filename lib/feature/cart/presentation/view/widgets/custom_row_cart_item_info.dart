import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/model/product.dart';
import '../../../../../core/utils/widgets/custom_rating.dart';

class CustomRowCartItemInfo extends StatelessWidget {
  const CustomRowCartItemInfo({
    super.key,
    required this.product,
    required this.index,
  });
  final Product product;
  final int index;
  @override
  Widget build(BuildContext context) {
    //var cubit = CartCubit.get(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
            product.imageProduct!,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 23,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomRating(size: 12),
              Text(
                product.nameProduct!,
                style: AppStyles.textStyle18Bold.copyWith(
                  color: Colors.black,
                ),
              ),
              Text(
                'View Details',
                style: AppStyles.textStyle12Regular.copyWith(
                  color: kButtonColor,
                  decorationColor: kButtonColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: () async {
            // await cubit.deleteFirstProduct(index);
            // cubit.getCartData();
          },
          icon: Icon(
            Icons.delete,
            color: Color(0xffEC362B),
          ),
        ),
      ],
    );
  }
}
