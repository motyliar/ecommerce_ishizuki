// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';

class Product extends Equatable {
  final String id;
  final String category;
  final String name;
  final List<String> imgUrl;
  final String categoryImg;
  final double price;
  final String description;
  final int dimensionHeight;
  final int dimensionWidth;
  final int weight;
  final bool isNew;
  final bool isSold;

  const Product(
      {this.id = '',
      required this.category,
      required this.name,
      required this.imgUrl,
      required this.categoryImg,
      required this.price,
      required this.description,
      required this.dimensionHeight,
      required this.dimensionWidth,
      required this.weight,
      required this.isNew,
      this.isSold = false});

  double currentPrice(BuildContext context, Product product) {
    double currentPricing = context.select(
        (CurrencyBloc bloc) => bloc.state.currentConversion * product.price);
    return currentPricing;
  }

  String getStringPrice(BuildContext context, Product product) {
    String currentPrice = context
        .select(
            (CurrencyBloc bloc) => bloc.state.currentConversion * product.price)
        .floor()
        .toStringAsFixed(1);
    String currentSing =
        context.select((CurrencyBloc bloc) => bloc.state.currentSign);
    return currentPrice + currentSing;
  }

  @override
  List<Object> get props => [
        id,
        category,
        name,
        imgUrl,
        price,
        description,
        dimensionHeight,
        dimensionWidth,
        weight,
        isNew,
        isSold
      ];

  static const List<Product> products = [];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'category': category,
      'name': name,
      'imgUrl': imgUrl,
      'categoryImg': categoryImg,
      'price': price,
      'description': description,
      'dimensionHeight': dimensionHeight,
      'dimensionWidth': dimensionWidth,
      'weight': weight,
      'isNew': isNew,
      'isSold': isSold,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'] as String,
      category: json['category'] as String,
      name: json['name'] as String,
      imgUrl:
          (json['imgUrl'] as List<dynamic>).map((e) => e.toString()).toList(),
      categoryImg: json['categoryImg'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      dimensionHeight: json['dimensionHeight'] as int,
      dimensionWidth: json['dimensionWidth'] as int,
      weight: json['weight'] as int,
      isNew: json['isNew'] as bool,
      isSold: json['isSold'] as bool,
    );
  }

  String toJson() => json.encode(toMap());
}
