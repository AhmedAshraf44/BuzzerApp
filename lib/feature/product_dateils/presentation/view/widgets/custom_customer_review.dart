import 'package:flutter/material.dart';
import '../../../../../core/utils/app_styles.dart';
import 'custom_customer_review_list_view.dart';

class CustomCustomerReview extends StatelessWidget {
  const CustomCustomerReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Customer Reviews',
          style: AppStyles.textStyle18Bold.copyWith(
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 29,
        ),
        CustomCustomerReviewListView(),
        SizedBox(
          height: 80,
        ),
      ],
    );
  }
}
