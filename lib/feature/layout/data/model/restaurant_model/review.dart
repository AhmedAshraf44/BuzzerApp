import 'package:equatable/equatable.dart';

class Review extends Equatable {
  final String? date;
  final String? name;
  final String? comment;
  final String? image;

  const Review({this.image, this.comment, this.date, this.name});

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        date: json['date'] as String?,
        name: json['name'] as String?,
        comment: json['comment'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'date': date,
        'name': name,
        'comment': comment,
        'image': image,
      };

  @override
  List<Object?> get props => [image, date, name, comment];
}
