import 'dart:developer';

import 'package:buzzer_app/constants.dart';
import 'package:buzzer_app/core/errors/failure.dart';
import 'package:buzzer_app/feature/cart/data/model/cart_model/cart.dart';
import 'package:buzzer_app/feature/cart/data/repos/cart_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/services/firesore_service.dart';

class CartRepoImpl implements CartRepo {
  final FireStoreService fireStoreService;

  CartRepoImpl(this.fireStoreService);
  @override
  Future<Either<Failure, CartModel>> getCartData() async {
    try {
      var data = await fireStoreService.getData(
        path: kCart,
        docuementId: kuId,
      );
      log('cart data get from Firestore.');
      return Right(CartModel.fromJson(data));
    } catch (e) {
      log('Error getting cart data from Firestore: $e');
      return Left(ServerFailure('Failed to get data $e'));
    }
  }
}
