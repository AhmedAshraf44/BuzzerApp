import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitialState());

  static OtpCubit get(context) => BlocProvider.of(context);
  Future<void> verifyOTP(
      {required String otp, required String verificationId}) async {
    emit(OtpLoadingState());
    try {
      final credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(OtpSuccessState());
    } catch (e) {
      emit(OtpFailureState(errorMessage: e.toString()));
      log(e.toString());
    }
  }
}
