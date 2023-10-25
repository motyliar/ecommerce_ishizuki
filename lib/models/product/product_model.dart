import 'package:equatable/equatable.dart';
import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:flutter/material.dart';

class Product extends Equatable {
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
      {required this.category,
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
}
