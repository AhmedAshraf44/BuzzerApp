import 'package:flutter/material.dart';

import 'custom_profile_info_item.dart';

class CustomProfileInfo extends StatelessWidget {
  const CustomProfileInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .25),
              blurRadius: 20,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomProfileInfoItem(
                title: 'Name',
                subTitle: 'Click to enter name',
              ),
              Divider(),
              CustomProfileInfoItem(
                title: 'Phone Number',
                subTitle: '+966 0000 000',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
