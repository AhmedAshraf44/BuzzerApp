import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

class CustomDescription extends StatelessWidget {
  const CustomDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
      ],
    );
  }
}
