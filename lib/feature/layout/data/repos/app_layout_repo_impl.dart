import 'dart:developer';

import 'package:buzzer_app/constants.dart';
import 'package:buzzer_app/core/errors/failure.dart';
import 'package:buzzer_app/feature/layout/data/repos/app_layout_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/services/firesore_service.dart';
import '../../../../core/utils/restaurant_data.dart';

class AppLayoutRepoImpl implements AppLayoutRepo {
  final FireStoreService fireStoreService;

  AppLayoutRepoImpl(this.fireStoreService);

  @override
  Future<Either<Failure, void>> addRestaurant() async {
    try {
      await fireStoreService.addRestaurantData(
        path: kRestaurant,
        documentId: '1WONmopv1kc2f3ZojLnYK9lys662',
        data: RestaurantData.restaurantsData,
      );
      log('Restaurant data added to Firestore.');
      return const Right(null);
    } catch (e) {
      log('Error adding restaurant data to Firestore: $e');
      return Left(ServerFailure('Failed to add product $e'));
    }
  }
}
