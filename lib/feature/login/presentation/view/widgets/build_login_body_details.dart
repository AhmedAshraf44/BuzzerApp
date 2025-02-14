import 'package:buzzer_app/feature/login/presentation/view/widgets/build_login_details.dart';
import 'package:flutter/material.dart';
import '../../../../../constants.dart';

class BuildLoginBodyDetails extends StatelessWidget {
  const BuildLoginBodyDetails({
    super.key,
    required this.phoneController,
  });

  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(150),
      ),
      child: Container(
        height: MediaQuery.sizeOf(context).height / 2,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BuildLoginDetails(phoneController: phoneController),
        ),
      ),
    );
  }
}
