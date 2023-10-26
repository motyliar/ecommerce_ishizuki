import 'dart:convert';

import 'package:ecommerce_ishizuki/models/models_export.dart';
import 'package:http/http.dart' as http;

class OrderRepository {
  String url = 'https://ecommerce-backend-0oii.onrender.com/api/order/';

  Future<void> postOrder(String orderSymbol, Address address, Cart cart,
      List<Product> product) async {
    final Uri uri = Uri.parse(url);

    final response = await http.post(uri,
        headers: {"Content-Type": "application/json"},
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

    print(response.body);
  }
}
