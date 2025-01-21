import 'package:buzzer_app/feature/layout/data/model/restaurant_model/review.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/widgets/custom_rating.dart';

class CustomCustomer extends StatelessWidget {
  const CustomCustomer({
    super.key,
    required this.review,
  });
  final Review review;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
            review.image!,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                review.name!,
                style: AppStyles.textStyle16Bold.copyWith(
                  color: Colors.black,
                ),
              ),
              Text(
                review.date!,
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
