import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imgUrl;
  final String logoImgUrl;
  const Category(
      {required this.name, required this.imgUrl, required this.logoImgUrl});

  @override
  List<Object?> get props => [name, imgUrl, logoImgUrl];

  static const List<Category> category = [
    Category(
        name: 'Pots',
        imgUrl: 'images/pot.jpg',
        logoImgUrl: 'images/pots_logo.png'),
    Category(
        name: 'Rocks',
        imgUrl: 'images/rock.jpg',
        logoImgUrl: 'images/rocks_logo.png'),
    Category(
        name: 'Slabs',
        imgUrl: 'images/slab.jpg',
        logoImgUrl: 'images/slabs_logo.png'),
  ];
}
