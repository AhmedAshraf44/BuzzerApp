import 'package:buzzer_app/constants.dart';
import 'package:buzzer_app/core/utils/app_router.dart';
import 'package:buzzer_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_text_form_field.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'Login Code',
          style: AppStyles.textStyle22SemiBold,
        ),
      ),
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
                            style: AppStyles.textStyle24SemiBold,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Enter the authentation code sent at ******896',
                            style: AppStyles.textStyle18Regular
                                .copyWith(color: kTextColor),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Please enter your phone number';
                              } else {
                                return null;
                              }
                            },
                            hintText: '0102761882',
                            keyboardType: TextInputType.phone,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
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
            bottom: MediaQuery.sizeOf(context).height / 3 + 35,
            child: CustomButton(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  GoRouter.of(context).push(AppRouter.kRegisterView);
                }
              },
              text: 'Submit',
              formKey: formKey,
            ),
          ),
          Positioned(
            bottom: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(children: [
                Text(
                  'Didin\'t receive the code? ',
                  style: AppStyles.textStyle18Regular.copyWith(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                Text(
                  'Resend',
                  style: AppStyles.textStyle18Regular.copyWith(
                    color: kFeaturedTextColor,
                    fontSize: 15,
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
