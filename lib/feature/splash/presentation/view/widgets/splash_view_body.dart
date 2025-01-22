import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.imagesSplash,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
