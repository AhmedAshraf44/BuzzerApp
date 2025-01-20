import 'dart:developer';

import 'package:buzzer_app/feature/login/data/model/login_data_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);

  Future<void> phoneNumberAuthentation({required String phoneNumber}) async {
    emit(LoginLoadingState());
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (phoneAuthCredential) async {
        await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
        log(phoneAuthCredential.providerId);
      },
      verificationFailed: (error) {
        if (error.code == 'invalid-phone-number') {
          log('The provided phone number is not valid.');
          emit(
            LoginFailureState(
              errorMessage: 'The provided phone number is not valid.',
            ),
          );
        } else {
          log('Error. Please try again later.');
          emit(
            LoginFailureState(
              errorMessage: 'Error. Please try again later.',
            ),
          );
          log(error.message.toString());
          log(error.code.toString());
        }
      },
      codeSent: (verificationId, forceResendingToken) {
        // this.verificationId = verificationId;
        log(verificationId.toString());
        emit(LoginSuccessState(
            model: LoginDataModel(
                phoneNumber: phoneNumber, verificationId: verificationId)));
      },
      codeAutoRetrievalTimeout: (verificationId) {
        // this.verificationId = verificationId;
        log('Auto retrieval time out');
      },
    );
  }
}
