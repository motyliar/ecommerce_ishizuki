import 'dart:convert';
import 'package:ecommerce_ishizuki/common/constans/repository_constans.dart';
import 'package:ecommerce_ishizuki/models/models_export.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  // GET DATA FROM SERVER

  Future<List<Product>> getData() async {
    final response = await http.get(Uri.parse(kProductToUriParseEndPoint),
        headers: kHeadersContentType);

    final List result = jsonDecode(response.body);

    return result.map((e) => Product.fromJson(e)).toList();
  }
  // DELETE DATA BY ID FROM DB

  Future<List<Product>> deleteData(String id) async {
    final Uri urlParse = Uri.parse(kProductToUriParseEndPoint + id);

    await http.delete(urlParse, headers: kHeadersContentType);

    final responseData = await http.get(Uri.parse(kProductToUriParseEndPoint),
        headers: kHeadersContentType);

    final List result = jsonDecode(responseData.body);
    return result.map((e) => Product.fromJson(e)).toList();
  }
  // POST DATA TO DB

  Future<List<Product>> postData() async {
    await http.post(Uri.parse(kProductToUriParseEndPoint),
        headers: kHeadersContentType,
        body: jsonEncode({
          "name": "",
          "email": "",
          "long": "",
          "width": 45,
          "height": 60,
          "description": "",
          "productKind": ""
        }));
    final responseData = getData();
    return responseData;
  }

  Future<void> updateSoldProduct(List<String> soldProducts) async {
    final Uri uri = Uri.parse('${kProductToUriParseEndPoint}update');

    await http.put(uri,
        headers: kHeadersContentType,
        body: jsonEncode({"productIds": soldProducts}));
  }
}
