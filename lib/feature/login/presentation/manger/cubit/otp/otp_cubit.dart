import 'dart:developer';
import 'package:buzzer_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/cache_helper.dart';

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
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      emit(OtpSuccessState());
      CacheHelper.setData(key: 'uId', value: userCredential.user?.uid);
      kuId = userCredential.user?.uid.toString() ?? '';
      log(userCredential.user?.uid.toString() ?? '');
    } catch (e) {
      emit(OtpFailureState(errorMessage: e.toString()));
      log(e.toString());
    }
  }
}
