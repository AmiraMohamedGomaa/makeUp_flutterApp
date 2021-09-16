import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:makeup_store/models/user_model.dart';
import 'package:makeup_store/screens/home/home_screen.dart';



Future<UserModel?> register(String name , String mail , String pass,String phone)async{
  final client = Dio();
  final url = 'https://dart-makeup-store.herokuapp.com/signup';
  try {
    final response = await client.post(url,
      data:{
        'fullName':name,
        'email':mail,
        'password':pass,
        'mobile':phone,
      },);
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

UserModel parseResponse(response) =>
    UserModel.fromJson(json.decode(response));