class UserDataModel {
  final String email;
  final String type;
  final String name;
  final String phone;
  final String address;
  final String city;
  // final String image;
  final String uId;
  UserDataModel({
    required this.email,
    required this.type,
    required this.name,
    required this.phone,
    required this.address,
    required this.city,
    //  required this.image,
    required this.uId,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      email: json['email'],
      type: json['type'],
      name: json['name'],
      phone: json['phone'],
      address: json['address'],
      city: json['city'],
      //  image: json['image'],
      uId: json['uId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'type': type,
      'name': name,
      'phone': phone,
      'address': address,
      'city': city,
      //  'image': image,
      'uId': uId,
    };
  }
}
