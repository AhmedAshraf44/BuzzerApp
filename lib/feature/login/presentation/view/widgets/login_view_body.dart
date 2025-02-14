import 'package:buzzer_app/feature/login/presentation/view/widgets/buid_desgin_auth.dart';
import 'package:buzzer_app/feature/login/presentation/view/widgets/custom_row_privacy_policy.dart';
import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import '../../manger/cubit/login/login_cubit.dart';
import 'build_login_details.dart';

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
              BuidDesignAuth(
                widget: BuildLoginDetails(phoneController: phoneController),
              ),
            ],
          ),
        ),
        Positioned(
          top: kButtonHeight,
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
        // Positioned(
        //   top: kDesignHeight + 40,
        //   child: CustomRowNotAccount(),
        // ),
        Positioned(
          bottom: 10,
          child: CustomRowPrivacyPolicy(),
        ),
      ],
    );
  }
}
