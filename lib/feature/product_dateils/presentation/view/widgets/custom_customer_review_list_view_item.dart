import 'package:buzzer_app/feature/product_dateils/presentation/view/widgets/custom_customer.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/model/review.dart';

class CustomCustomerReviewListViewItem extends StatelessWidget {
  const CustomCustomerReviewListViewItem({
    super.key,
    required this.review,
  });

  final Review review;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCustomer(
          review: review,
        ),
        if (review.comment != null)
          SizedBox(
            height: 12,
          ),
        if (review.comment != null)
          Text(
            review.comment!,
            style: AppStyles.textStyle14Regular.copyWith(
              color: Colors.black,
            ),
          ),
      ],
    );
  }
}
