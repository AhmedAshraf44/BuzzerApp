import 'package:buzzer_app/core/utils/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_styles.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome!',
                style: AppStyles.textStyle20Bold,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Please enter your phone number to continue using our app.',
                style: AppStyles.textStyle16Regular,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                controller: phoneController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter your phone number';
                  } else {
                    return null;
                  }
                },
                hintText: 'Phone Number',
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
