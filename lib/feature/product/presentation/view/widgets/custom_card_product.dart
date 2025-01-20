import 'package:buzzer_app/feature/product/presentation/view/widgets/custom_card_product_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_router.dart';

class CustomCardProduct extends StatelessWidget {
  const CustomCardProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kProductDetialsView);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          //   Container(
          // decoration: BoxDecoration(
          //   boxShadow: [
          //     BoxShadow(
          //       color: Colors.black.withValues(alpha: .15),
          //       blurRadius: 40,
          //       spreadRadius: 0,
          //       offset: const Offset(0, 0),
          //     ),
          //   ],
          // ),
          //child:
          CustomCardProductItem(),
          Positioned(
            right: 28,
            bottom: 110,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                Assets.imagesProduct,
                // height: 130,
                // width: 130,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
