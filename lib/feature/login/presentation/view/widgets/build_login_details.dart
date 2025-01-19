import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/widgets/custom_text_form_field.dart';

class BuildLoginDetails extends StatelessWidget {
  const BuildLoginDetails({
    super.key,
    required this.phoneController,
  });

  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
