import 'package:buzzer_app/constants.dart';
import 'package:flutter/material.dart';
import 'custom_home_item_details.dart';
import '../../../../layout/data/model/restaurant_model/restaurant.dart';

class BuildHomeListViewItem extends StatelessWidget {
  const BuildHomeListViewItem({
    super.key,
    required this.restaurants,
  });
  final Restaurant restaurants;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: kTextColor,
            blurRadius: 5,
          )
        ],
        border: Border.all(color: Color(0xffCCCCCC)),
        color: Colors.white,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              bottomLeft: Radius.circular(18),
              bottomRight: Radius.circular(150),
              topRight: Radius.circular(150),
            ),
            child: Image.network(
              height: MediaQuery.sizeOf(context).height / 6,
              width: MediaQuery.sizeOf(context).width / 2.5,
              restaurants.image!,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 14,
          ),
          CustomHomeItemDetails(
            restaurants: restaurants,
          ),
        ],
      ),
    );
  }
}
