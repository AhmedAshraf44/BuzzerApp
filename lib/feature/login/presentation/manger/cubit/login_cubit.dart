import 'dart:developer';

import 'package:buzzer_app/feature/login/data/model/login_data_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());
  var verificationId = '';
  var auth = FirebaseAuth.instance;
  static LoginCubit get(context) => BlocProvider.of(context);

  Future<void> phoneNumberAuthentation({required String phoneNumber}) async {
    emit(LoginPhoneLoadingState());
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (phoneAuthCredential) async {
        await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (error) {
        if (error.code == 'invalid-phone-number') {
          log('The provided phone number is not valid.');
          emit(
            LoginPhoneFailureState(
              errorMessage: 'The provided phone number is not valid.',
            ),
          );
        } else {
          log('Error. Please try again later.');
          emit(
            LoginPhoneFailureState(
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
        emit(LoginPhoneSuccessState(
            model: LoginDataModel(
                phoneNumber: phoneNumber, verificationId: verificationId)));
      },
      codeAutoRetrievalTimeout: (verificationId) {
        // this.verificationId = verificationId;
        log('Auto retrieval time out');
      },
    );
    // await auth.verifyPhoneNumber(
    //   phoneNumber: phoneNumber,
    //   verificationCompleted: (phoneAuthCredential) async {
    //     await auth.signInWithCredential(phoneAuthCredential);
    //   },
    //   verificationFailed: (error) {
    //     if (error.code == 'invalid-phone-number') {
    //       log('The provided phone number is not valid.');
    //       emit(
    //         LoginPhoneFailureState(
    //             errorMessage: 'The provided phone number is not valid.'),
    //       );
    //     } else {
    //       log('Error. : ');
    //       log(error.message.toString());
    //       log(error.code.toString());
    //       emit(
    //         LoginPhoneFailureState(
    //             errorMessage: 'Error. Please try again later.'),
    //       );
    //     }
    //   },
    //   codeSent: (verificationId, forceResendingToken) {
    //     this.verificationId = verificationId;
    //   },
    //   codeAutoRetrievalTimeout: (verificationId) {
    //     this.verificationId = verificationId;
    //   },
    // );
  }

  Future<bool> verifyOTP({required String otp}) async {
    emit(LoginOtpLoadingState());
    var userCredential = await auth.signInWithCredential(
      PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      ),
    );
    emit(LoginOtpSuccessState());
    return userCredential.user != null ? true : false;
  }
}
