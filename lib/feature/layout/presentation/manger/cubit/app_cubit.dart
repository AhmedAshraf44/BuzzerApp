import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../cart/presentation/view/cart_view.dart';
import '../../../../home/presentation/view/home_view.dart';
import '../../../../profile/presentation/view/profile_view.dart';
import '../../../data/model/restaurant_model/restaurant_model.dart';

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

  RestaurantModel? model;
  Future<void> getRestaurnatsData() async {
    emit(AppLayoutLoadingState());
    //var uId = CacheHelper.getData(key: 'uId');
    await FirebaseFirestore.instance
        .collection(kRestaurant)
        .doc('1WONmopv1kc2f3ZojLnYK9lys662')
        .get()
        .then(
      (value) {
        model = RestaurantModel.fromJson(value.data()!);
        // log(model?.name ?? "");
        emit(AppLayoutSuccessState());
      },
    ).catchError(
      (error) {
        log(error.toString());
        emit(AppLayoutFailureState(errorMessage: error.toString()));
      },
    );
  }

  Future<void> updateProductQuantity(int productId, int newQuantity) async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection(kCart).doc(kuId);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot docSnapshot = await transaction.get(docRef);
      if (docSnapshot.exists) {
        // Get the products list
        List<dynamic> products =
            List.from(docSnapshot['products']); // Create a copy of the list

        // Find the product with the specified id
        bool productFound = false;
        for (var product in products) {
          if (product['id'] == productId) {
            // Update the quantity
            product['quantity'] = newQuantity;
            productFound = true;
            break; // Exit the loop early
          }
        }

        if (productFound) {
          // Update the document with the modified products list
          transaction.update(docRef, {
            'products': products,
          });
          print("Product quantity updated successfully.");
        } else {
          print("Product with ID $productId not found.");
        }
      } else {
        print("Document does not exist.");
      }
    }).catchError((error) {
      print("Failed to update product quantity: $error");
    });

    //   if (docSnapshot.exists) {
    //     List<dynamic> products = docSnapshot['products'];

    //     for (var product in products) {
    //       if (product['id'] == productId) {
    //         product['quantity'] = newQuantity;

    //         transaction.update(docRef, {
    //           'products': products,
    //         });
    //         log(' productId : newQuantity : ${productId} : ${newQuantity}');
    //         print("Product quantity updated successfully.");
    //         return;
    //       }
    //     }
    //   } else {
    //     print("No products to delete.");
    //   }
    // }).catchError((error) {
    //   print("Failed to update product quantity: $error");
    // });
  }
  // Future<void> updateCart() {
  //   return FirebaseFirestore.instance
  //       .collection(kRestaurant)
  //       .doc('1WONmopv1kc2f3ZojLnYK9lys662')
  //       .update({'products.0.is_cart': true})
  //       .then((value) => print("User Updated"))
  //       .catchError((error) => print("Failed to update user: $error"));
  // }
}


// Future<void> updateProductId(String restaurantId, int oldProductId, int newProductId) async {
//   // Reference to the restaurant document
//   DocumentReference restaurantDoc = FirebaseFirestore.instance
//       .collection('restaurants') // Replace with your collection name
//       .doc(restaurantId); // Replace with the actual restaurant document ID

//   // Start a transaction to ensure atomicity
//   FirebaseFirestore.instance.runTransaction((transaction) async {
//     // Get the restaurant document
//     DocumentSnapshot restaurantSnapshot = await transaction.get(restaurantDoc);

//     if (restaurantSnapshot.exists) {
//       // Get the products list
//       List<dynamic> products = restaurantSnapshot['restaurant'][0]['products'];

//       // Find the product with the specified old id
//       for (var product in products) {
//         if (product['id'] == oldProductId) {
//           // Update the product id
//           product['id'] = newProductId;

//           // Update the document with the modified products list
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

// void main() async {
//   // Example usage
//   await updateProductId('1WONmopv1kc2f3ZojLnYK9lys662', 1, 2); // Replace with actual IDs
// }