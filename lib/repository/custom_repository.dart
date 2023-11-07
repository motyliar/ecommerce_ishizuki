import 'dart:convert';

import 'package:ecommerce_ishizuki/common/constans/repository_constans.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:ecommerce_ishizuki/models/models_export.dart';

class CustomRepository {
  Future<void> postData(Custom customData) async {
    final response = await http.post(Uri.parse(kCustomToUriParseEndPoint),
        headers: kHeadersContentType,
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
      debugPrint(response.body);
    } else {
      debugPrint("Error: ${response.statusCode}");
    }
  }
}
