import 'package:equatable/equatable.dart';

import '../../../../../core/utils/model/product.dart';

class CartModel extends Equatable {
  final List<Product>? products;
  const CartModel({this.products});

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'products': products?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [products];
}
