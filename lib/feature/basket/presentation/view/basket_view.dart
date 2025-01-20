import 'package:buzzer_app/constants.dart';
import 'package:buzzer_app/core/function/build_app_bar.dart';
import 'package:buzzer_app/core/utils/app_styles.dart';
import 'package:buzzer_app/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/widgets/custom_rating.dart';

class BasketView extends StatelessWidget {
  const BasketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: 'Basket',
        leadingWidth: 40,
      ),
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
              Text(
                'Park Lane Hotel',
                style: AppStyles.textStyle18Bold.copyWith(
                  color: Colors.black,
                ),
              ),
              Text(
                'Restaurant',
                style: AppStyles.textStyle18Regular.copyWith(
                  color: Color(0xffEC362B),
                ),
              ),
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

class CartViewBody extends StatelessWidget {
  const CartViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(top: 22),
            child: CustomCartItem(),
          ),
        ),
        SizedBox(
          height: 17,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: kTextColor,
                  blurRadius: 8,
                  spreadRadius: 3,
                  offset: const Offset(0, 0))
            ],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order Summary',
                  style: AppStyles.textStyle18Bold.copyWith(
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 5),
                  child: Divider(
                    color: kTextColor,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price:',
                      style: AppStyles.textStyle16Regular.copyWith(
                        color: Colors.black.withValues(alpha: .5),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'SAR 300',
                      style: AppStyles.textStyle16Bold.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Quantity:',
                      style: AppStyles.textStyle16Regular.copyWith(
                        color: Colors.black.withValues(alpha: .5),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '×2',
                      style: AppStyles.textStyle16Bold.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal:',
                      style: AppStyles.textStyle16Regular.copyWith(
                        color: Colors.black.withValues(alpha: .5),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'SAR 600',
                      style: AppStyles.textStyle16Bold.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CustomCartItem extends StatelessWidget {
  const CustomCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: kTextColor,
              blurRadius: 8,
              spreadRadius: 3,
              offset: const Offset(0, 0))
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 22),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: CircleAvatar(
                    radius: 30,
                    child: Image.asset(
                      Assets.imagesProduct,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 23,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomRating(size: 12),
                      Text(
                        'Butter Sandwich',
                        style: AppStyles.textStyle18Bold.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'View Details',
                        style: AppStyles.textStyle12Regular.copyWith(
                          color: kButtonColor,
                          decorationColor: kButtonColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    //  context
                    //      .read<CartCubit>()
                    //      .removeCart(index: index);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Color(0xffEC362B),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price:',
                  style: AppStyles.textStyle16Regular.copyWith(
                    color: Colors.black.withValues(alpha: .5),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'SAR 300',
                  style: AppStyles.textStyle16Bold.copyWith(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Quantity:',
                  style: AppStyles.textStyle16Regular.copyWith(
                    color: Colors.black.withValues(alpha: .5),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '×2',
                  style: AppStyles.textStyle16Bold.copyWith(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal:',
                  style: AppStyles.textStyle16Regular.copyWith(
                    color: Colors.black.withValues(alpha: .5),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'SAR 600',
                  style: AppStyles.textStyle16Bold.copyWith(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
