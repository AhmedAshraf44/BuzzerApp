import 'dart:developer';

import 'package:buzzer_app/constants.dart';
import 'package:buzzer_app/core/errors/failure.dart';
import 'package:buzzer_app/core/utils/model/product.dart';
import 'package:buzzer_app/feature/product_dateils/data/repos/product_datails_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/services/firesore_service.dart';

class ProductDatailsRepoImpl implements ProductDatailsRepo {
  final FireStoreService fireStoreService;

  ProductDatailsRepoImpl(this.fireStoreService);

  @override
  Future<Either<Failure, void>> addDataToCartFireStore(
      List<Product> products) async {
    try {
      await fireStoreService.addDataToCartFireStore(
        path: kCart,
        documentId: kuId,
        products: products,
      );
      log('Cart data added to Firestore.');
      return Right(null);
    } catch (error) {
      log('Error adding cart data to Firestore: $error');
      return Left(ServerFailure('Error adding cart data to Firestore: $error'));
    }
  }
}
// Future<void> addDataToCartFireStore(List<Product> products) async {
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   List<Map<String, dynamic>> cartData =
//       products.map((product) => product.toJson()).toList();
//   try {
//     await firestore.collection(kCart).doc(kuId).set({
//       "products": cartData,
//     });
//     log('Cart data added to Firestore.');
//   } catch (error) {
//     log('Error adding cart data to Firestore: $error');
//   }
// }
