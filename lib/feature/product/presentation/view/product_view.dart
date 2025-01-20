import 'package:buzzer_app/constants.dart';
import 'package:buzzer_app/core/function/build_app_bar.dart';
import 'package:buzzer_app/core/utils/app_router.dart';
import 'package:buzzer_app/core/utils/app_styles.dart';
import 'package:buzzer_app/core/utils/widgets/custom_rating.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_images.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Supplier Products', leadingWidth: 40),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 25,
          left: 25,
          top: 100,
        ),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            childAspectRatio: 1.1,
            mainAxisSpacing: 75,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: CustomCard(),
            );
          },
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kProductDetialsView);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          //   Container(
          // decoration: BoxDecoration(
          //   boxShadow: [
          //     BoxShadow(
          //       color: Colors.black.withValues(alpha: .15),
          //       blurRadius: 40,
          //       spreadRadius: 0,
          //       offset: const Offset(0, 0),
          //     ),
          //   ],
          // ),
          //child:
          Card(
            elevation: 6,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      CustomRating(
                        size: 13,
                      ),
                      const Spacer(),
                      Text(
                        'Featured',
                        style: AppStyles.textStyle12Bold.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Butter Sandwich',
                    style: AppStyles.textStyle14Bold.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Par Lane  Hotel',
                    style: AppStyles.textStyle12Regular.copyWith(
                      color: Colors.black.withValues(alpha: .5),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'Restaurant',
                        style: AppStyles.textStyle12Regular.copyWith(
                          color: Color(0xffEC362B),
                        ),
                      ),
                      Spacer(),
                      Text(
                        'SAR 89',
                        style: AppStyles.textStyle12Regular.copyWith(
                            color: Color(0xff8B8B8B),
                            decoration: TextDecoration.lineThrough),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'SAR 79',
                        style: AppStyles.textStyle14Bold.copyWith(
                          color: kSecondaryColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 28,
            bottom: 110,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                Assets.imagesProduct,
                // height: 130,
                // width: 130,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
