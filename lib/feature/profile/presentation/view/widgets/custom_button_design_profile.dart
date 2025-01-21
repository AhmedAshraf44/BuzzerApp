import 'package:buzzer_app/feature/profile/presentation/view/widgets/custom_button_profile.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class CustomButtonDesignProfile extends StatefulWidget {
  const CustomButtonDesignProfile({
    super.key,
  });

  @override
  State<CustomButtonDesignProfile> createState() =>
      _CustomButtonDesignProfileState();
}

class _CustomButtonDesignProfileState extends State<CustomButtonDesignProfile> {
  bool isActive = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: .25),
          blurRadius: 20,
        )
      ]),
      child: Row(
        children: [
          CustomButtonProfile(
            title: 'My Information',
            onTap: () {
              setState(() {
                isActive = !isActive;
              });
            },
            containerColor: isActive ? kButtonColor : Colors.white,
          ),
          CustomButtonProfile(
            title: 'Manage Account',
            onTap: () {
              setState(() {
                isActive = !isActive;
              });
            },
            containerColor: isActive ? Colors.white : kButtonColor,
          ),
        ],
      ),
    );
  }
}
