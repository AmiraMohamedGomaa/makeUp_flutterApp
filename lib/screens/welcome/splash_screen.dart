import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeup_store/apis/lookups_api.dart';
import 'package:makeup_store/constants/constants.dart';
import 'package:makeup_store/constants/shared.dart';
import 'package:makeup_store/models/lookups_model.dart';
import 'package:makeup_store/screens/home/home_screen.dart';
import 'package:makeup_store/screens/welcome/welcome_screen.dart';


class SplashScreen extends StatefulWidget {

  const SplashScreen({Key? key}) : super(key: key);


  @override
  _SplashScreenState createState() => _SplashScreenState();


}

class _SplashScreenState extends State<SplashScreen> {

  Future<Widget> loadFromFuture() async {
    return Future.value(WelcomeScreen());
  }

@override
  void initState() {
   super.initState();
    getBrands().then((value) {
     if (value != null) {
         Shared.lookupsObject = value;
         HomeScreen();
         Navigator.push(context, MaterialPageRoute(builder: (context)=>
             WelcomeScreen()));
     }else{

     }
   });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xfff7f7f7),
      body: Column(

       children: [
           Padding(
             padding: EdgeInsets.only(top: 100),
           ),

         Image.asset('assets/images/splash.png',),
         Text('loading...' ,style: TextStyle(color: Colors.grey,fontSize: 16),),
         CircularProgressIndicator(color: Colors.grey,),


       ],
      ),
    );

  }
}


