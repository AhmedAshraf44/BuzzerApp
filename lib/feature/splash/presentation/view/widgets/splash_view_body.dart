import 'package:buzzer_app/feature/splash/presentation/view/widgets/custom_image.dart';
import 'package:buzzer_app/feature/splash/presentation/view/widgets/custom_logo_app.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(200),
      ),
      child: Column(
        children: [
          CustomLogoApp(),
          CustomImage(),
        ],
      ),
    );
  }
}
