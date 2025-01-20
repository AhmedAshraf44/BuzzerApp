import 'package:buzzer_app/constants.dart';
import 'package:buzzer_app/core/function/build_app_bar.dart';
import 'package:buzzer_app/core/utils/app_styles.dart';
import 'package:buzzer_app/core/utils/widgets/custom_rating.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/widgets/custom_button.dart';

class ProductDetialsView extends StatelessWidget {
  const ProductDetialsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Product Detail', leadingWidth: 40),
      bottomSheet: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(width: 1, color: Colors.grey.shade300),
            )),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 11),
          child: Row(
            children: [
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: kTextColor),
                  ),
                  child: Icon(
                    Icons.remove,
                    size: 30,
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                '02',
                style:
                    AppStyles.textStyle16Regular.copyWith(color: Colors.black),
              ),
              SizedBox(
                width: 8,
              ),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black,
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              SizedBox(
                width: 13,
              ),
              Expanded(
                child: CustomButton(
                  onTap: () {
                    showModalBottomSheet(
                      isDismissible: true,
                      backgroundColor: Colors.transparent.withValues(alpha: .4),
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Center(
                            child: AspectRatio(
                              aspectRatio: 1 / 0.58,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withValues(alpha: 0.5),
                                      spreadRadius: 4,
                                      blurRadius: 6,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: const AddTaskBottomSheet(),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  text: 'ADD TO BASKET',
                  //  onPressed: () {
                  // showBottomSheet(context);
                  //  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 17),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height / 3,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      Assets.imagesProductD,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              CustomRating(
                size: 20,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Butter Sandwich',
                style: AppStyles.textStyle18Bold.copyWith(color: Colors.black),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    'SAR 79',
                    style: AppStyles.textStyle16Bold.copyWith(
                      color: kSecondaryColor,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'SAR 89',
                    style: AppStyles.textStyle12Regular.copyWith(
                      color: Color(0xff8B8B8B),
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 24),
                child: Divider(
                  color: kTextColor,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Supplier',
                    style: AppStyles.textStyle18Bold.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Rate Supplier',
                    style: AppStyles.textStyle14Regular.copyWith(
                      color: kButtonColor,
                      decorationColor: kButtonColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Image.asset(
                    Assets.imagesTest,
                    height: 85,
                  ),
                  SizedBox(
                    width: 19,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomRating(
                        size: 12,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        'The Skye',
                        style: AppStyles.textStyle16Bold
                            .copyWith(color: Colors.black),
                      ),
                      Text(
                        'Restaurant',
                        style: AppStyles.textStyle12Regular
                            .copyWith(color: Color(0xffEC362B)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: kPrimaryColor,
                            size: 12,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            'Main Market Riyadh, KSA',
                            style: AppStyles.textStyle14Regular.copyWith(
                              fontSize: 10,
                              color: Colors.black.withValues(alpha: .5),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 24),
                child: Divider(
                  color: kTextColor,
                ),
              ),
              Text(
                'Description',
                style: AppStyles.textStyle18Bold.copyWith(
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Serving French cuisine and owned by the Comisar family and located since 1966 at 114 E. 6th Street in Cincinnati, Ohio, The move also means the end of La Normandie restaurant, a tavern and chophouse below the Maisonette. One of Cincinnati\'s most celebrated restaurants, the Maisonette earned the Mobil Travel Guide\'s five-star rating for 41 consecutive years. the Maisonette received the five-star ...  ',
                style: AppStyles.textStyle14Regular.copyWith(
                  color: Color(0xff8B8B8B),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 24),
                child: Divider(
                  color: kTextColor,
                ),
              ),
              Text(
                'Customer Reviews',
                style: AppStyles.textStyle18Bold.copyWith(
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 29,
              ),
              Column(
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
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 24),
                child: Divider(
                  color: kTextColor,
                ),
              ),
              CustomCustomer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 24),
                child: Divider(
                  color: kTextColor,
                ),
              ),
              Column(
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
              SizedBox(
                height: 80,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
      child: Column(
        children: [
          Text(
            'Note',
            style: AppStyles.textStyle20Bold.copyWith(color: Colors.black),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            textAlign: TextAlign.center,
            'You have already selected products from a different supplier. if you continue, your cart and selection will be removed.',
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
                text: 'No',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              CustomButton(
                width: MediaQuery.sizeOf(context).width / 2 - 50,
                text: 'Yes',
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomCustomer extends StatelessWidget {
  const CustomCustomer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(Assets.imagesPdImage),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Linda',
                style: AppStyles.textStyle16Bold.copyWith(
                  color: Colors.black,
                ),
              ),
              Text(
                'Jun 28,2021',
                style: AppStyles.textStyle16Regular.copyWith(
                  color: Colors.black.withValues(alpha: .5),
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        CustomRating(size: 12),
      ],
    );
  }
}
