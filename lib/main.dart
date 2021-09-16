import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeup_store/constants/constants.dart';
import 'package:makeup_store/screens/welcome/splash_screen.dart';
import 'package:makeup_store/screens/welcome/welcome_screen.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'flutter Dimo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),


      );


  }

      }
