import 'package:flutter/material.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/widgets/custom_button.dart';

class AddProductBottomSheet extends StatelessWidget {
  const AddProductBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
      child: Column(
        children: [
          Text(
            'Added to Basket',
            style: AppStyles.textStyle20Bold.copyWith(color: Colors.black),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            textAlign: TextAlign.center,
            'You Item has been successfully added to the basket.',
            style: AppStyles.textStyle14Regular.copyWith(
              color: Color(0xff8B8B8B),
            ),
          ),
          SizedBox(
            height: 33,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                borderColor: Colors.black,
                buttonColor: Colors.white,
                width: MediaQuery.sizeOf(context).width / 2 - 50,
                text: 'CONT.SHOPPING',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              CustomButton(
                width: MediaQuery.sizeOf(context).width / 2 - 50,
                text: 'VIEW BASKET',
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
