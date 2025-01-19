import 'package:buzzer_app/feature/login/presentation/view/widgets/custom_row_privacy_policy.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/widgets/custom_button.dart';
import '../../manger/cubit/login_cubit.dart';
import 'build_login_body_details.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var phoneController = TextEditingController();
    return Stack(
      alignment: Alignment.center,
      children: [
        Form(
          key: formKey,
          child: Column(
            children: [
              BuildLoginBodyDetails(phoneController: phoneController),
            ],
          ),
        ),
        Positioned(
          bottom: MediaQuery.sizeOf(context).height / 3 + 35,
          child: CustomButton(
            onTap: () async {
              if (formKey.currentState!.validate()) {
                LoginCubit.get(context).phoneNumberAuthentation(
                    phoneNumber: phoneController.text.trim());
              }
            },
            text: 'Next',
          ),
        ),
        Positioned(
          bottom: 10,
          child: CustomRowPrivacyPolicy(),
        ),
      ],
    );
  }
}
