import 'package:equatable/equatable.dart';

import 'product.dart';

class Restaurant extends Equatable {
  final String? address;
  final String? name;
  final String? type;
  final String? image;

  final List<Product>? products;

  const Restaurant(
      {this.image, this.address, this.name, this.type, this.products});

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        address: json['address'] as String?,
        image: json['image'] as String?,
        name: json['name'] as String?,
        type: json['type'] as String?,
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'image': image,
        'address': address,
        'name': name,
        'type': type,
        'products': products?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [image, address, name, type, products];
}
