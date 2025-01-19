part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  // final LoginModel model;

  // const RegisterSuccessState({required this.model});
}

class RegisterFailureState extends RegisterState {
  final String errorMessage;

  RegisterFailureState({required this.errorMessage});
}

class UserCreateLoadingState extends RegisterState {}

class UserCreateSuccessState extends RegisterState {
  final String? uId;

  UserCreateSuccessState({required this.uId});
}

class UserCreateFailureState extends RegisterState {
  final String errorMessage;

  UserCreateFailureState({required this.errorMessage});
}

class RegisterChangeIconPasswordState extends RegisterState {}
