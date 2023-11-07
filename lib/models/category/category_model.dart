import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imgUrl;
  final String logoImgUrl;
  const Category(
      {required this.name, required this.imgUrl, required this.logoImgUrl});

  @override
  List<Object?> get props => [name, imgUrl, logoImgUrl];
}
