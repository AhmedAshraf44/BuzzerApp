import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../model/cart_model/cart.dart';

abstract class CartRepo {
  Future<Either<Failure, CartModel>> getCartData();
}
