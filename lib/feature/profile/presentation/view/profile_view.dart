import 'package:buzzer_app/feature/profile/presentation/view/widgets/custom_profile_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_images.dart';
import 'widgets/custom_button_design_profile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 49,
            ),
            child: SvgPicture.asset(
              Assets.imagesProfileView,
              fit: BoxFit.cover,
            ),
          ),
          CustomButtonDesignProfile(),
          CustomProfileInfo(),
        ],
      ),
    );
  }
}
