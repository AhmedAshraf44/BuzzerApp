part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitialState extends AppState {}

final class AppChangeBottomNavState extends AppState {}
