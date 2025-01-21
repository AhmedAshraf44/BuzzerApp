import 'package:equatable/equatable.dart';

import 'restaurant.dart';

class RestaurantModel extends Equatable {
	final List<Restaurant>? restaurant;

	const RestaurantModel({this.restaurant});

	factory RestaurantModel.fromJson(Map<String, dynamic> json) {
		return RestaurantModel(
			restaurant: (json['restaurant'] as List<dynamic>?)
						?.map((e) => Restaurant.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toJson() => {
				'restaurant': restaurant?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [restaurant];
}
