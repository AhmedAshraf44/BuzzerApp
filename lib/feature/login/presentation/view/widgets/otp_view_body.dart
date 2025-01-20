import 'package:buzzer_app/constants.dart';
import 'package:buzzer_app/feature/login/presentation/view/widgets/buid_desgin_auth.dart';
import 'package:buzzer_app/feature/login/presentation/view/widgets/build_otp_details.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../data/model/login_data_model.dart';
import '../../manger/cubit/otp/otp_cubit.dart';

class OtpViewBody extends StatelessWidget {
  const OtpViewBody({
    super.key,
    required this.model,
  });

  final LoginDataModel model;

  @override
  Widget build(BuildContext context) {
    var otpController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Stack(
      alignment: Alignment.center,
      children: [
        Form(
          key: formKey,
          child: Column(
            children: [
              BuidDesignAuth(
                widget:
                    BuildOtpDetails(model: model, otpController: otpController),
              ),
            ],
          ),
        ),
        Positioned(
          top: kButtonHeight,
          child: CustomButton(
            onTap: () async {
              if (formKey.currentState!.validate()) {
                OtpCubit.get(context).verifyOTP(
                    otp: otpController.text,
                    verificationId: model.verificationId);
              }
            },
            text: 'Submit',
          ),
        ),
        Positioned(
          bottom: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(children: [
              Text(
                'Didin\'t receive the code? ',
                style: AppStyles.textStyle14Regular.copyWith(
                  color: Colors.black,
                ),
              ),
              Text(
                'Resend',
                style: AppStyles.textStyle14Regular.copyWith(
                  color: kSecondaryColor,
                  decorationColor: kSecondaryColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
