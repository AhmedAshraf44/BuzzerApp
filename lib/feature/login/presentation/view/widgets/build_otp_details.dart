import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/widgets/custom_text_form_field.dart';
import '../../../data/model/login_data_model.dart';

class BuildOtpDetails extends StatelessWidget {
  const BuildOtpDetails({
    super.key,
    required this.model,
    required this.otpController,
  });

  final LoginDataModel model;
  final TextEditingController otpController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Login by OTP',
          style: AppStyles.textStyle20Bold,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Enter the authentation code sent at ******982',
          style: AppStyles.textStyle16Regular,
        ),
        SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          initialValue: model.phoneNumber,
          enabled: false,
        ),
        SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          controller: otpController,
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'Please enter your phone number';
            } else {
              return null;
            }
          },
          hintText: 'Login Code',
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}
