import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:ecommerce_ishizuki/models/models_export.dart';

class CustomRepository {
  String url = 'https://ecommerce-backend-0oii.onrender.com/api/custom/';

  Future<void> postData(Custom customData) async {
    final Uri uri = Uri.parse(url);

    final response = await http.post(uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": customData.name,
          "email": customData.email,
          "long": customData.long,
          "width": customData.width,
          "height": customData.height,
          "description": customData.description,
          "productKind": customData.productKind,
          "base64": customData.base64,
        }));
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print("Error: ${response.statusCode}");
    }
  }
}
