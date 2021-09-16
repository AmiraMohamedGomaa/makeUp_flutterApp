import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeup_store/screens/login/login_screen.dart';
import 'package:makeup_store/screens/register/register_screen.dart';
import '../../constants/constants.dart';
import 'background.dart';

class Body extends StatefulWidget {

  _BodyCreateState createState() => _BodyCreateState();
}
  class _BodyCreateState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[

            Text(
              "WELCOME TO Miro Store",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            Image.asset(
              "assets/images/splash.png",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child:ElevatedButton(
                  child: Text(
                    'SIGN IN',style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                      primary: kPrimaryColor,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      textStyle: TextStyle(
                          color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
                  onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen())); },),
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.8,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child:ElevatedButton(
                    child: Text(
                      'SIGN UP',style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                        primary: kPrimaryColor,
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        textStyle: TextStyle(
                            color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()),);
                    },)
              ),
            ),
          ],
        ),
      ),
    );
  }

}
