import 'package:buzzer_app/constants.dart';
import 'package:buzzer_app/core/utils/app_router.dart';
import 'package:buzzer_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_text_form_field.dart';
import 'widgets/custom_row_privacy_policy.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'Sign In',
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
                            'Welcome!',
                            style: AppStyles.textStyle26SemiBold,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Please enter your phone number to continue using our app.',
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
                            hintText: 'Phone Number',
                            keyboardType: TextInputType.phone,
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
                  GoRouter.of(context).push(AppRouter.kLoginView);
                }
              },
              text: 'Next',
              formKey: formKey,
            ),
          ),
          Positioned(
            bottom: 10,
            child: CustomRowPrivacyPolicy(),
          ),
        ],
      ),
    );
  }
}
