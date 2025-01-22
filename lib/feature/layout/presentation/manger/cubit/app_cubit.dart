import 'package:buzzer_app/feature/layout/data/repos/app_layout_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../cart/presentation/view/cart_view.dart';
import '../../../../home/presentation/view/home_view.dart';
import '../../../../profile/presentation/view/profile_view.dart';
import '../../../data/model/restaurant_model/restaurant_model.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(this.appLayoutRepo) : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List pages = const [
    HomeView(),
    CartView(),
    ProfileView(),
  ];

  final AppLayoutRepo appLayoutRepo;
  Future<void> addRestaurant() async {
    emit(AddRestaurantLoadingState());
    var result = await appLayoutRepo.addRestaurant();
    result.fold(
      (failure) =>
          emit(AddRestaurantFailureState(errorMessage: failure.message)),
      (sucess) => emit(AddRestaurantSuccessState()),
    );
  }

  RestaurantModel? model;

  Future<void> getRestaurnatsData() async {
    emit(AppLayoutLoadingState());
    var result = await appLayoutRepo.getRestaurnatsData();
    result.fold(
      (failure) => emit(AppLayoutFailureState(errorMessage: failure.message)),
      (sucess) {
        model = sucess;
        return emit(AppLayoutSuccessState());
      },
    );
  }

  Future<void> updateProductQuantity(int productId, int newQuantity) async {
    emit(UpdataRestaurantLoadingState());
    var result =
        await appLayoutRepo.updateProductQuantity(productId, newQuantity);
    result.fold(
      (failure) =>
          emit(UpdataRestaurantFailureState(errorMessage: failure.message)),
      (sucess) => emit(UpdataRestaurantSuccessState()),
    );
  }

  void changeBottomNavIndex(index) {
    currentIndex = index;
    emit(AppChangeBottomNavState());
  }
}


// Future<void> updateProductId(String restaurantId, int oldProductId, int newProductId) async {
//   // Reference to the restaurant document
//   DocumentReference restaurantDoc = FirebaseFirestore.instance
//       .collection('restaurants') // Replace with your collection name
//       .doc(restaurantId); // Replace with the actual restaurant document ID

//   FirebaseFirestore.instance.runTransaction((transaction) async {
//     DocumentSnapshot restaurantSnapshot = await transaction.get(restaurantDoc);

//     if (restaurantSnapshot.exists) {
//       // Get the products list
//       List<dynamic> products = restaurantSnapshot['restaurant'][0]['products'];

//       for (var product in products) {
//         if (product['id'] == oldProductId) {
//           // Update the product id
//           product['id'] = newProductId;

//           transaction.update(restaurantDoc, {
//             'restaurant.0.products': products,
//           });

//           print("Product ID updated successfully.");
//           return; // Exit the function after updating
//         }
//       }

//       print("Product with ID $oldProductId not found.");
//     } else {
//       print("Restaurant document does not exist.");
//     }
//   }).catchError((error) {
//     print("Failed to update product ID: $error");
//   });
// }

