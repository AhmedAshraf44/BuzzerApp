import 'dart:developer';

import 'package:buzzer_app/constants.dart';
import 'package:buzzer_app/core/errors/failure.dart';
import 'package:buzzer_app/feature/layout/data/repos/app_layout_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/services/firesore_service.dart';
import '../../../../core/utils/restaurant_data.dart';
import '../model/restaurant_model/restaurant_model.dart';

class AppLayoutRepoImpl implements AppLayoutRepo {
  final FireStoreService fireStoreService;

  AppLayoutRepoImpl(this.fireStoreService);

  @override
  Future<Either<Failure, void>> addRestaurant() async {
    try {
      await fireStoreService.addRestaurantData(
        path: kRestaurant,
        documentId: kuId,
        data: RestaurantData.restaurantsData,
      );
      log('Restaurant data added to Firestore.');
      return const Right(null);
    } catch (e) {
      log('Error adding restaurant data to Firestore: $e');
      return Left(ServerFailure('Failed to add product $e'));
    }
  }

  @override
  Future<Either<Failure, RestaurantModel>> getRestaurnatsData() async {
    try {
      var data = await fireStoreService.getData(
        path: kRestaurant,
        docuementId: kuId,
      );
      log('Restaurant data get from Firestore.');
      //log(data.toString());

      return Right(RestaurantModel.fromJson(data));
    } catch (e) {
      log('Error getting restaurant data from Firestore: $e');
      return Left(ServerFailure('Failed to get data $e'));
    }
  }

  @override
  Future<Either<Failure, DocumentReference<Map<String, dynamic>>>>
      updateProductQuantity(int productId, int newQuantity) async {
    try {
      var docRef = await fireStoreService.updateProductQuantity(
          path: kCart, docuementId: kuId);
      FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot docSnapshot = await transaction.get(docRef);
        if (docSnapshot.exists) {
          List<dynamic> products = List.from(docSnapshot['products']);

          bool productFound = false;
          for (var product in products) {
            if (product['id'] == productId) {
              // Update the quantity
              product['quantity'] = newQuantity;
              productFound = true;
              break;
            }
          }
          if (productFound) {
            transaction.update(docRef, {
              'products': products,
            });
            log("Product quantity updated successfully.");
          } else {
            log("Product with ID $productId not found.");
            return Left(ServerFailure("Product with ID $productId not found."));
          }
        } else {
          log("Document does not exist.");
          return Left(ServerFailure("Document does not exist."));
        }
      });
      return Right(docRef);
    } catch (e) {
      log("Failed to update product quantity: $e");
      return Left(ServerFailure("Failed to update product quantity: $e"));
    }
  }
}

// Future<void> updateProductQuantity(int productId, int newQuantity) async {
//   DocumentReference docRef =
//       FirebaseFirestore.instance.collection(kCart).doc(kuId);
//   FirebaseFirestore.instance.runTransaction((transaction) async {
//     DocumentSnapshot docSnapshot = await transaction.get(docRef);
//     if (docSnapshot.exists) {
//       List<dynamic> products = List.from(docSnapshot['products']);

//       bool productFound = false;
//       for (var product in products) {
//         if (product['id'] == productId) {
//           // Update the quantity
//           product['quantity'] = newQuantity;
//           productFound = true;
//           break;
//         }
//       }
//       if (productFound) {
//         transaction.update(docRef, {
//           'products': products,
//         });
//         print("Product quantity updated successfully.");
//       } else {
//         print("Product with ID $productId not found.");
//       }
//     } else {
//       print("Document does not exist.");
//     }
//   }).catchError((error) {
//     print("Failed to update product quantity: $error");
//   });
// }


  // Future<void> updateProductQuantity(int productId, int newQuantity) async {
  //   DocumentReference docRef =
  //       FirebaseFirestore.instance.collection(kCart).doc(kuId);
  //   FirebaseFirestore.instance.runTransaction((transaction) async {
  //     DocumentSnapshot docSnapshot = await transaction.get(docRef);
  //     if (docSnapshot.exists) {
  //       List<dynamic> products = List.from(docSnapshot['products']);

  //       bool productFound = false;
  //       for (var product in products) {
  //         if (product['id'] == productId) {
  //           // Update the quantity
  //           product['quantity'] = newQuantity;
  //           productFound = true;
  //           break;
  //         }
  //       }
  //       if (productFound) {
  //         transaction.update(docRef, {
  //           'products': products,
  //         });
  //         print("Product quantity updated successfully.");
  //       } else {
  //         print("Product with ID $productId not found.");
  //       }
  //     } else {
  //       print("Document does not exist.");
  //     }
  //   }).catchError((error) {
  //     print("Failed to update product quantity: $error");
  //   });
  // }