import 'package:flutter/material.dart';
import '../../../../../core/utils/widgets/my_divider.dart';
import '../../../../../core/utils/model/product.dart';
import 'custom_customer_review_list_view_item.dart';

class CustomCustomerReviewListView extends StatelessWidget {
  const CustomCustomerReviewListView({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: product.reviews!.length,
      itemBuilder: (context, index) =>
          CustomCustomerReviewListViewItem(review: product.reviews![index]),
      separatorBuilder: (context, index) => MyDivider(),
    );
  }
}
