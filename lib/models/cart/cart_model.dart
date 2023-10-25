import 'package:equatable/equatable.dart';
import 'package:ecommerce_ishizuki/models/models_export.dart';

class Cart extends Equatable {
  final List<Product> products;
  final String value;
  final double currencyCalculate;

  const Cart(
      {this.products = const <Product>[],
      this.value = '',
      this.currencyCalculate = 1});

  List totalPrice() {
    List<double> totalList = [];
    for (int i = 0; i < products.length; i++) {
      totalList.add(products[i].price);
    }
    return totalList;
  }

  double deliveryPrice() {
    double multiplicationPrice = products.length.toDouble();
    double price;
    if (value == 'EU') {
      price = 35.0;
    } else if (value == 'USA') {
      price = 110.0;
    } else if (value == 'UK') {
      price = 45.0;
    } else if (value == 'Other') {
      price = 120.0;
    } else {
      price = 0.00;
    }
    return price * multiplicationPrice;
  }

  double currencyPrice() {
    double totalPrice = total * currencyCalculate;
    return totalPrice;
  }

  double get totalPricing => deliveryPrice() + total;

  double get total =>
      products.fold(0, (value, element) => value + element.price);
  double totalPriceDelivery() {
    double finalPrice = currencyPrice() + deliveryPrice();
    return finalPrice;
  }

  String get getPrice => total.toStringAsFixed(2);
  String get getDeliveryPrice => deliveryPrice().toStringAsFixed(2);
  String get getTotalPricing => totalPriceDelivery().floor().toStringAsFixed(1);

  String get getCurrencyPricing => currencyPrice().floor().toStringAsFixed(1);

  @override
  List<Object?> get props => [products, value, currencyCalculate];
}
