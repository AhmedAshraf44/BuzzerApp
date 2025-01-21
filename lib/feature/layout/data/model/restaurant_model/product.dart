import 'package:equatable/equatable.dart';

import 'review.dart';

class Product extends Equatable {
  final String? description;
  final int? discountPrice;
  final bool? isCart;
  final String? nameProduct;
  final String? place;
  final int? price;
  final String? type;
  final String? address;
  final String? name;
  final String? uId;
  final int? id;
  final int? quantity;
  final String? imageProduct;
  final String? imageRestaurant;

  final List<Review>? reviews;

  const Product({
    this.imageProduct,
    this.imageRestaurant,
    this.address,
    this.name,
    this.uId,
    this.id,
    this.quantity,
    this.type,
    this.description,
    this.discountPrice,
    this.isCart,
    this.nameProduct,
    this.place,
    this.price,
    this.reviews,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        description: json['description'] as String?,
        discountPrice: json['discount_price'] as int?,
        isCart: json['is_cart'] as bool?,
        nameProduct: json['name_product'] as String?,
        place: json['place'] as String?,
        price: json['price'] as int?,
        type: json['type_restaurant'] as String?,
        address: json['address_restaurant'] as String?,
        name: json['name_restaurant'] as String?,
        imageProduct: json['image_product'] as String?,
        imageRestaurant: json['image_restaurant'] as String?,
        uId: json['uId'] as String?,
        id: json['id'] as int?,
        quantity: json['quantity'] as int?,
        reviews: (json['reviews'] as List<dynamic>?)
            ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'image_restaurant': imageRestaurant,
        'image_product': imageProduct,
        'description': description,
        'discount_price': discountPrice,
        'is_cart': isCart,
        'name_product': nameProduct,
        'place': place,
        'price': price,
        'type_res': type,
        'reviews': reviews?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      imageRestaurant,
      imageProduct,
      address,
      name,
      uId,
      id,
      quantity,
      type,
      description,
      discountPrice,
      isCart,
      nameProduct,
      place,
      price,
      reviews,
    ];
  }
}
