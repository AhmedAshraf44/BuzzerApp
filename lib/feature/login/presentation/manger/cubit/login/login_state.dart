part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitialState extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {
  final LoginDataModel model;

  LoginSuccessState({required this.model});
}

final class LoginFailureState extends LoginState {
  final String errorMessage;

  LoginFailureState({required this.errorMessage});
}
