import 'package:buzzer_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utils/model/product.dart';

abstract class ProductDatailsRepo {
  Future<Either<Failure, void>> addDataToCartFireStore(List<Product> products);
}
