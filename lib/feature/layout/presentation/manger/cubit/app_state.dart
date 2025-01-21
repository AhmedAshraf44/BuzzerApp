part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitialState extends AppState {}

final class AppChangeBottomNavState extends AppState {}

final class AppLayoutLoadingState extends AppState {}

final class AppLayoutSuccessState extends AppState {}

final class AppLayoutFailureState extends AppState {
  final String errorMessage;

  AppLayoutFailureState({required this.errorMessage});
}
