import 'package:ecommerce_ishizuki/models/models_export.dart';

List<Product> productList = [
  const Product(
      category: 'Rocks',
      name: 'Rock #1',
      imgUrl: [
        'images/product1.jpg',
        'images/product2.jpg',
        'images/product3.jpg'
      ],
      categoryImg: 'images/rocks_logo.png',
      price: 150,
      description:
          'This rock is really smooth and have really good vibe for planting multiply bonsai trees',
      dimensionHeight: 70,
      dimensionWidth: 40,
      weight: 12,
      isNew: true,
      isSold: false),
  const Product(
      category: 'Rocks',
      name: 'Rock #2',
      imgUrl: [
        'images/product1.jpg',
        'images/product2.jpg',
        'images/product3.jpg'
      ],
      categoryImg: 'images/rocks_logo.png',
      price: 150,
      description: 'no description',
      dimensionHeight: 0,
      dimensionWidth: 0,
      weight: 0,
      isNew: false,
      isSold: false),
  const Product(
      category: 'Slabs',
      name: 'Slab #1',
      imgUrl: ['images/slab1.jpg', 'images/slab2.jpg', 'images/slab3.jpg'],
      categoryImg: 'images/slabs_logo.png',
      price: 150,
      description: 'no description',
      dimensionHeight: 0,
      dimensionWidth: 0,
      weight: 0,
      isNew: true,
      isSold: false),
  const Product(
      category: 'Slabs',
      name: 'Slab #2',
      imgUrl: ['images/slab1.jpg', 'images/slab2.jpg', 'images/slab3.jpg'],
      categoryImg: 'images/slabs_logo.png',
      price: 150,
      description: 'no description',
      dimensionHeight: 0,
      dimensionWidth: 0,
      weight: 0,
      isNew: true,
      isSold: false),
  const Product(
      category: 'Pots',
      name: 'Pot #1',
      imgUrl: ['images/product1.jpg'],
      categoryImg: 'images/pots_logo.png',
      price: 150,
      description: 'no description',
      dimensionHeight: 0,
      dimensionWidth: 0,
      weight: 0,
      isNew: false,
      isSold: false),
];
