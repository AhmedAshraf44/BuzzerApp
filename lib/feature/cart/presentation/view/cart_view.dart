import 'package:buzzer_app/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: buildAppBar(
      //   title: 'Basket',
      //   leadingWidth: 40,
      // ),
      // bottomSheet: Container(
      //   color: Colors.white,
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 13),
      //     child: CustomButton(
      //       width: double.infinity,
      //       text: 'PROCEED TO CHECKOUT',
      //       onTap: () {},
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 13,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   'Park Lane Hotel',
              //   style: AppStyles.textStyle18Bold.copyWith(
              //     color: Colors.black,
              //   ),
              // ),
              // Text(
              //   'Restaurant',
              //   style: AppStyles.textStyle18Regular.copyWith(
              //     color: Color(0xffEC362B),
              //   ),
              // ),
              CartViewBody(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: CustomButton(
                  width: double.infinity,
                  text: 'PROCEED TO CHECKOUT',
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
