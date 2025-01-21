import 'package:buzzer_app/feature/layout/data/model/restaurant_model/product.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

class CustomDescription extends StatelessWidget {
  const CustomDescription({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: AppStyles.textStyle18Bold.copyWith(
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          product.description!,
          style: AppStyles.textStyle14Regular.copyWith(
            color: Color(0xff8B8B8B),
          ),
        ),
      ],
    );
  }
}
