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
        imgUrl: 'http://motyliar.webd.pro/.sharedphotos/pot.jpg',
        logoImgUrl: 'http://motyliar.webd.pro/.sharedphotos/pots_logo.png'),
    Category(
        name: 'Rocks',
        imgUrl: 'http://motyliar.webd.pro/.sharedphotos/rock.jpg',
        logoImgUrl: 'http://motyliar.webd.pro/.sharedphotos/rocks_logo.png'),
    Category(
        name: 'Slabs',
        imgUrl: 'http://motyliar.webd.pro/.sharedphotos/slab.jpg',
        logoImgUrl: 'http://motyliar.webd.pro/.sharedphotos/slabs_logo.png'),
  ];
}
