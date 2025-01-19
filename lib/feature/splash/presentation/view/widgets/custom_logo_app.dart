import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_images.dart';

class CustomLogoApp extends StatelessWidget {
  const CustomLogoApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2 - 50,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            kPrimaryColor,
            kSecondaryColor,
            kPrimaryColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          SvgPicture.asset(
            Assets.imagesLogo,
            colorFilter: const ColorFilter.mode(kButtonColor, BlendMode.srcIn),
          ),
          SizedBox(
            height: 30,
          ),
          SvgPicture.asset(
            Assets.imagesBUZZERAPP,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ],
      ),
    );
  }
}
