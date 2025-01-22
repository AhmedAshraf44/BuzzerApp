part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitialState extends AppState {}

final class AppChangeBottomNavState extends AppState {}

final class AddRestaurantLoadingState extends AppState {}

final class AddRestaurantSuccessState extends AppState {}

final class AddRestaurantFailureState extends AppState {
  final String errorMessage;

  AddRestaurantFailureState({required this.errorMessage});
}

final class AppLayoutLoadingState extends AppState {}

final class AppLayoutSuccessState extends AppState {}

final class AppLayoutFailureState extends AppState {
  final String errorMessage;

  AppLayoutFailureState({required this.errorMessage});
}

final class UpdataRestaurantLoadingState extends AppState {}

final class UpdataRestaurantSuccessState extends AppState {}

final class UpdataRestaurantFailureState extends AppState {
  final String errorMessage;

  UpdataRestaurantFailureState({required this.errorMessage});
}
