import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cart/presentation/view/cart_view.dart';
import '../../../../home/presentation/view/home_view.dart';
import '../../../../profile/presentation/view/profile_view.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List pages = const [
    HomeView(),
    CartView(),
    ProfileView(),
  ];

  void changeBottomNavIndex(index) {
    currentIndex = index;
    emit(AppChangeBottomNavState());
  }
}
