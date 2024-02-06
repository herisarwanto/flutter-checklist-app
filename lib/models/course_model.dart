import 'package:equatable/equatable.dart';

class CourseModel extends Equatable {
  const CourseModel({
    this.name,
    this.thumbnail,
    this.lessonNum,
    this.price,
    this.id,
  });

  factory CourseModel.fromJson(Map<String, dynamic> map) {
    return CourseModel(
      name: map['name'] as String? ?? '',
      thumbnail: map['thumbnail'] as String? ?? '',
      lessonNum: map['lessonNum'] as int?,
      price: map['price'] as int?,
      id: map['id'] as int?,
    );
  }

  final String? name;
  final String? thumbnail;
  final int? lessonNum;
  final int? price;
  final int? id;

  CourseModel copyWith({
    String? name,
    String? thumbnail,
    int? lessonNum,
    int? price,
    int? id,
  }) =>
      CourseModel(
        name: name ?? this.name,
        thumbnail: thumbnail ?? this.thumbnail,
        lessonNum: lessonNum ?? this.lessonNum,
        price: price ?? this.price,
        id: id ?? this.id,
      );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'thumbnail': thumbnail,
      'lessonNum': lessonNum,
      'price': price,
      'id': id,
    };
  }

  @override
  List<Object?> get props => [name, thumbnail, lessonNum, price, id];
}
