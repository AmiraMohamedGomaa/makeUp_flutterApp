import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:makeup_store/models/product_model.dart';


Future<ProductModel?> getProducts(
    {int? page,
    String? keyword,
    String? brand,
    String? productType}) async {
  var url = "https://dart-makeup-store.herokuapp.com/products";
  if(page!=null) {
     url+='/page=$page';
    if (keyword != null) {
      url += "/keyword=$keyword";
    }
    if (brand != null) {
      url += "/brand=$brand";
    }
    if (productType != null) {
      url += "/productType=$productType";
    }
  }
  final client = Dio();
  try {
    final response = await client.get(url);
    if (response.statusCode == 200 && response.data != null) {
      return compute(parseResponse, response.data);
    } else {
      debugPrint('${response.statusCode} : ${response.data.toString()}');
    }
  } on DioError catch (error) {
    debugPrint(error.message);
  } finally {
    client.clear();
  }
  return null;
}

ProductModel parseResponse(response) =>
    ProductModel.fromJson(json.decode(response));
