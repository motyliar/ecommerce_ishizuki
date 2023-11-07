import 'dart:convert';

import 'package:ecommerce_ishizuki/common/constans/repository_constans.dart';
import 'package:ecommerce_ishizuki/models/models_export.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OrderRepository {
  Future<void> postOrder(String orderSymbol, Address address, Cart cart,
      List<Product> product) async {
    final response = await http.post(Uri.parse(kOrderToUriParseEndPoint),
        headers: kHeadersContentType,
        body: jsonEncode({
          "orderNumber": orderSymbol,
          "name": address.name,
          "email": address.email,
          "address":
              "${address.street} ${address.numbers}${address.city}${address.zipCode}${address.country}",
          "totalPrice": cart.getTotalPricing,
          "deliveryPrice": cart.getDeliveryPrice,
          "products": product
              .map((e) => {
                    "productId": e.id,
                    "name": e.name,
                    "imgUrl": e.imgUrl[0],
                    "price": e.price
                  })
              .toList(),
        }));

    debugPrint(response.body);
  }
}
