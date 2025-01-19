import 'package:buzzer_app/core/function/build_app_bar.dart';
import 'package:buzzer_app/core/utils/widgets/custom_button.dart';
import 'package:buzzer_app/core/utils/widgets/custom_text_form_field.dart';
import 'package:buzzer_app/feature/register/presentation/manger/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants.dart';
import '../../../../core/utils/app_styles.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar:
          buildAppBar(title: 'Register As Cafe/Restaurant', leadingWidth: 20),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = RegisterCubit.get(context);
            return Form(
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
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Register Now!',
                          style: AppStyles.textStyle20Bold,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CustomTextFormField(
                          controller: cubit.typeController,
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
                          controller: cubit.nameController,
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
                          controller: cubit.emailController,
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
                          controller: cubit.phoneController,
                          hintText: 'Phone Number',
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please enter your Phone Number';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.phone,
                          obscureText: cubit.phoneObscureText,
                          suffixIcon: IconButton(
                            onPressed: () {
                              cubit.changeIconPhone();
                            },
                            icon: cubit.phoneObscureText
                                ? const Icon(
                                    Icons.visibility,
                                    color: kButtonColor,
                                  )
                                : const Icon(
                                    Icons.visibility_off,
                                    color: kButtonColor,
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          controller: cubit.passwordController,
                          hintText: 'Password',
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please enter your Password';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.text,
                          obscureText: cubit.passwordObscureText,
                          suffixIcon: IconButton(
                            onPressed: () {
                              cubit.changeIconPassword();
                            },
                            icon: cubit.passwordObscureText
                                ? const Icon(
                                    Icons.visibility,
                                    color: kButtonColor,
                                  )
                                : const Icon(
                                    Icons.visibility_off,
                                    color: kButtonColor,
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          controller: cubit.confirmPasswordController,
                          hintText: 'Confirm Password',
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please enter your Confirm Password';
                            } else if (value != cubit.passwordController.text) {
                              return 'Password does not match';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.text,
                          obscureText: cubit.confirmPasswordObscureText,
                          suffixIcon: IconButton(
                            onPressed: () {
                              cubit.changeIconConfirmPassword();
                            },
                            icon: cubit.confirmPasswordObscureText
                                ? const Icon(
                                    Icons.visibility,
                                    color: kButtonColor,
                                  )
                                : const Icon(
                                    Icons.visibility_off,
                                    color: kButtonColor,
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          controller: cubit.addressController,
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
                            color: kButtonColor,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          controller: cubit.cityController,
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
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomButton(
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  await cubit.registerUser();
                                }
                              },
                              text: 'Register',
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
