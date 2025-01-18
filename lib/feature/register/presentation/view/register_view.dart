import 'package:buzzer_app/core/utils/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../core/utils/app_styles.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'Register As Cafe/Restaurant',
          style: AppStyles.textStyle22SemiBold,
        ),
      ),
      body: Form(
        key: formKey,
        child: Container(
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
                  'Register Now!',
                  style: AppStyles.textStyle24SemiBold,
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  hintText: 'Type',
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your Type';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  hintText: 'Full Name',
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your Full Name';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  hintText: 'Email',
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your Email';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  hintText: 'Phone Number',
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your Phone Number';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.phone,
                  suffixIcon: Icon(
                    Icons.remove_red_eye,
                    color: kTextColor,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  hintText: 'Password',
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your Password';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.text,
                  suffixIcon: Icon(
                    Icons.remove_red_eye,
                    color: kTextColor,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  hintText: 'Confirm Password',
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your Confirm Password';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.text,
                  suffixIcon: Icon(
                    Icons.remove_red_eye,
                    color: kTextColor,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  hintText: 'Address',
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your Address';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.text,
                  suffixIcon: Icon(
                    Icons.location_on,
                    color: kTextColor,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  hintText: 'City',
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your City';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.text,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
