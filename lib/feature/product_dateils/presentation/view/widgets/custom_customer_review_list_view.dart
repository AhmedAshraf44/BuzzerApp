import 'package:buzzer_app/feature/product_dateils/presentation/view/widgets/custom_customer.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/widgets/my_divider.dart';

class CustomCustomerReviewListView extends StatelessWidget {
  const CustomCustomerReviewListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 2,
      itemBuilder: (context, index) => Column(
        children: [
          CustomCustomer(),
          SizedBox(
            height: 12,
          ),
          Text(
            'Hotel Booking System is complete Hotel Booking IT Solution comes with Hotel Quotation Booking System for travel agent, tour operator and hotel chains to collect the inventory of hotels from multiple sources .',
            style: AppStyles.textStyle14Regular.copyWith(
              color: Colors.black,
            ),
          ),
        ],
      ),
      // MyDivider(),
      separatorBuilder: (context, index) => MyDivider(),
    );
  }
}
