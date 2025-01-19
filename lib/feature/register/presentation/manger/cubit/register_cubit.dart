import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constants.dart';
import '../../../data/models/user_model.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  bool passwordObscureText = true;
  bool confirmPasswordObscureText = true;
  bool phoneObscureText = true;
  void changeIconPassword() {
    passwordObscureText = !passwordObscureText;
    emit(RegisterChangeIconPasswordState());
  }

  void changeIconConfirmPassword() {
    confirmPasswordObscureText = !confirmPasswordObscureText;
    emit(RegisterChangeIconPasswordState());
  }

  void changeIconPhone() {
    phoneObscureText = !phoneObscureText;
    emit(RegisterChangeIconPasswordState());
  }

  //var formKey = GlobalKey<FormState>();
  var typeController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var cityController = TextEditingController();

  // final RegisterRepo _registerRepo;
  Future<void> registerUser() async {
    emit(RegisterLoadingState());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      //credential.credential.
      await userCreate(uId: credential.user!.uid);
      log('${credential.user?.email}');
      log('${credential.user?.uid}');
      // emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailureState(
            errorMessage: 'The password provided is too weak.'));
        //print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailureState(
            errorMessage: 'The account already exists for that email.'));
        //print('The account already exists for that email.');
      } else {
        emit(RegisterFailureState(errorMessage: e.message ?? 'error'));
      }
    } catch (e) {
      emit(RegisterFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> userCreate({required String uId}) async {
    // emit(UserCreateLoadingState());
    try {
      UserDataModel model = UserDataModel(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        type: typeController.text,
        //   image: ,
        address: addressController.text,
        city: cityController.text,
        uId: uId,
      );
      await FirebaseFirestore.instance
          .collection(kUsers)
          .doc(uId)
          .set(model.toJson());
      emit(UserCreateSuccessState(uId: uId));
    } catch (e) {
      log(e.toString());
      emit(UserCreateFailureState(errorMessage: e.toString()));
    }
  }
}
