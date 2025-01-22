import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../model/restaurant_model/restaurant_model.dart';

abstract class AppLayoutRepo {
  Future<Either<Failure, void>> addRestaurant();
  Future<Either<Failure, RestaurantModel>> getRestaurnatsData();
  Future<Either<Failure, DocumentReference<Map<String, dynamic>>>>
      updateProductQuantity(int productId, int newQuantity);
}
