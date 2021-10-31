import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kamran/API_Services/ProductsApi.dart';

class RemoteService {
  static var client = http.Client();
  // ignore: missing_return
  static Future<List<Product>> fetchproduct() async {
    var response = await client.get(
        "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline");
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
