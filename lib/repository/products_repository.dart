import 'dart:convert';
import 'package:ecommerce_ishizuki/models/models_export.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  String url = 'http://192.168.1.41:3000/api/product/';

  Future<List<Product>> getData() async {
    final Uri urlParse = Uri.parse(url);
    print(urlParse);
    final response = await http.get(urlParse, headers: {
      'Content-Type': 'application/json',
    });

    final List result = jsonDecode(response.body);
    print(result);
    return result.map((e) => Product.fromJson(e)).toList();
  }

  Future<List<Product>> deleteData(String id) async {
    final Uri urlParse = Uri.parse(url + id);
    print(urlParse);
    final response = await http.delete(urlParse, headers: {
      'Content-Type': 'application/json',
    });
    print(response.statusCode);
    final responseData = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
    });
    print(responseData.statusCode);
    final List result = jsonDecode(responseData.body);
    return result.map((e) => Product.fromJson(e)).toList();
  }

  Future<List<Product>> postData() async {
    final Uri uriParse = Uri.parse(url);
    final response = await http.post(uriParse,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "name": "Bogdan",
          "email": "email@email.com",
          "long": "23",
          "width": 45,
          "height": 60,
          "description": "i would like to order something like that",
          "productKind": "slab"
        }));
    final responseData = getData();
    return responseData;
  }
}
