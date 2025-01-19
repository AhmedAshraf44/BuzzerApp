import 'dart:developer';

import 'package:buzzer_app/constants.dart';
import 'package:buzzer_app/core/utils/app_router.dart';
import 'package:buzzer_app/core/utils/app_styles.dart';
import 'package:buzzer_app/feature/login/data/model/login_data_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/function/build_app_bar.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_text_form_field.dart';

class LoginOtpView extends StatelessWidget {
  const LoginOtpView({super.key, required this.model});
  final LoginDataModel model;
  @override
  Widget build(BuildContext context) {
    var otpController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: buildAppBar(title: 'Login Code', leadingWidth: 20),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                ClipRRect(
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
                            //    controller: phoneController,
                            // validator: (value) {
                            //   if (value?.isEmpty ?? true) {
                            //     return 'Please enter your phone number';
                            //   } else {
                            //     return null;
                            //   }
                            // },
                            //  hintText: '01027618982',
                            // keyboardType: TextInputType.phone,
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
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height / 3 + 30,
            child: CustomButton(
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  try {
                    final credential = PhoneAuthProvider.credential(
                        verificationId: model.verificationId,
                        smsCode: otpController.text);
                    await FirebaseAuth.instance
                        .signInWithCredential(credential);
                    GoRouter.of(context).push(AppRouter.kRegisterView);
                  } catch (e) {
                    log(e.toString());
                  }
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
      ),
    );
  }
}
