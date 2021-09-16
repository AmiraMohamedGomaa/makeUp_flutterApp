import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:makeup_store/models/user_model.dart';


Future<UserModel?> login(String mail , String pass)async{
  final client = Dio();
  final url = 'https://dart-makeup-store.herokuapp.com/login';
  try {
    final response = await client.post(url,
      data:{
          'email': mail,
          'password': pass
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