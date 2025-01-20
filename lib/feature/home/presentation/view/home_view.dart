import 'package:buzzer_app/constants.dart';
import 'package:buzzer_app/core/utils/app_images.dart';
import 'package:buzzer_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/widgets/custom_rating.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: 17),
          child: InkWell(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kProductView);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Color(0xffCCCCCC)),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(14),
                        bottomLeft: Radius.circular(14)),
                    child: Image.asset(
                      Assets.imagesTest,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomRating(
                        size: 13,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'The Skye',
                        style: AppStyles.textStyle16Bold
                            .copyWith(color: Colors.black),
                      ),
                      Text(
                        'Restaurant',
                        style: AppStyles.textStyle14Regular
                            .copyWith(color: Color(0xffEC362B)),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: kPrimaryColor,
                            size: 14,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Main Market Riyadh, KSA',
                            style: AppStyles.textStyle12Regular.copyWith(
                              color: Colors.black.withValues(alpha: .5),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
