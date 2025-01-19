part of 'otp_cubit.dart';

@immutable
sealed class OtpState {}

final class OtpInitialState extends OtpState {}

final class OtpLoadingState extends OtpState {}

final class OtpSuccessState extends OtpState {}

final class OtpFailureState extends OtpState {
  final String errorMessage;

  OtpFailureState({required this.errorMessage});
}
