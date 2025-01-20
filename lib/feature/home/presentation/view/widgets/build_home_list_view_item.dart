import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/widgets/custom_home_and_supplier_item_details.dart';

class BuildHomeListViewItem extends StatelessWidget {
  const BuildHomeListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color(0xffCCCCCC)),
        color: Colors.white,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14), bottomLeft: Radius.circular(14)),
            child: Image.asset(
              Assets.imagesTest,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 14,
          ),
          CustomHomeAndSupplierItemDetails(),
        ],
      ),
    );
  }
}
