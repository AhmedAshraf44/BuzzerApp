import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class AppLayoutRepo {
  Future<Either<Failure, void>> addRestaurant();
}
