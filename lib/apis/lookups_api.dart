import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:makeup_store/models/lookups_model.dart';


Future<LookupsModel?> getBrands() async {
  final client = Dio();
  final url = 'https://dart-makeup-store.herokuapp.com/lookups';
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


LookupsModel parseResponse(response) =>
    LookupsModel.fromJson(json.decode(response));