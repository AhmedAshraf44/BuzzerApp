part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitialState extends LoginState {}

final class LoginPhoneLoadingState extends LoginState {}

final class LoginPhoneSuccessState extends LoginState {
  final LoginDataModel model;

  LoginPhoneSuccessState({required this.model});
}

final class LoginPhoneFailureState extends LoginState {
  final String errorMessage;

  LoginPhoneFailureState({required this.errorMessage});
}

final class LoginOtpLoadingState extends LoginState {}

final class LoginOtpSuccessState extends LoginState {}

final class LoginOtpFailureState extends LoginState {
  final String errorMessage;

  LoginOtpFailureState({required this.errorMessage});
}
