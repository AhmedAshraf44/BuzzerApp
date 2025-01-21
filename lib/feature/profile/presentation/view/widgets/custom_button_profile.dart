import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

class CustomButtonProfile extends StatelessWidget {
  const CustomButtonProfile({
    super.key,
    required this.title,
    this.onTap,
    required this.containerColor,
  });
  final String title;
  final void Function()? onTap;
  final Color containerColor;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: AppStyles.textStyle20Regular.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
              height: 3,
              color: containerColor,
            ),
          ],
        ),
      ),
    );
  }
}
