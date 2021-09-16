import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeup_store/constants/shared.dart';
import 'package:makeup_store/screens/login/login_screen.dart';
import 'package:makeup_store/apis/register_api.dart';
import 'package:makeup_store/constants/constants.dart';
import 'package:makeup_store/screens/home/home_screen.dart';


class RegisterScreen extends StatefulWidget {

  RegisterScreen();
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {


  final nameTextFieldController = TextEditingController();
  final phoneTextFieldController = TextEditingController();
  final emailTextFieldController = TextEditingController();
  final passwordTextFieldController = TextEditingController();

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();

  bool validateEmail = true,
      validatePassword = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Color(0xFFF7F7F7),
            height: size.height,
            width: double.infinity,
            // Here i can use size.width but use double.infinity because both work as a same
            child: Stack(
              alignment: Alignment.center,
              children:[
                Positioned(
                  top: 0,
                  left: 0,
                  child: Image.asset(
                    "assets/images/main_top.png",
                    width: size.width * 0.35,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Image.asset(
                    "assets/images/main_bottom.png",
                    width: size.width * 0.20,
                  ),
                ),

           Center(
           child: SingleChildScrollView(
          child: Column(
            children: [
            Text(
            "WELCOME TO Miro Store",
            style: TextStyle(fontWeight: FontWeight.bold,),
          ),
          SizedBox(height: size.height * 0.03),
          Image.asset(
            "assets/images/splash.png",
            height: size.height * 0.12,
          ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextField(
                  focusNode: nameFocusNode,
                  controller: nameTextFieldController,
                  onEditingComplete: () =>
                      FocusScope.of(context).requestFocus(phoneFocusNode),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.grey[300],
                    hintText: "Full Name",
                    labelText: "Full Name",
                    labelStyle: TextStyle(color:kPrimaryColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        style: BorderStyle.solid,
                      ),
                    ),
                    errorText: !validateEmail ? "Email is wrong" : null,
                    prefixIcon: Icon(Icons.accessibility_new_rounded, color:kPrimaryColor),
                    filled: true,
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextField(
                  focusNode: phoneFocusNode,
                  controller: phoneTextFieldController,
                  onEditingComplete: () =>
                      FocusScope.of(context).requestFocus(emailFocusNode),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.grey[300],
                    hintText: "Phone Number",
                    labelText: "Phone Number",
                    labelStyle: TextStyle(color:kPrimaryColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        style: BorderStyle.solid,
                      ),
                    ),
                    errorText: !validatePassword ? "password is wrong" : null,
                    prefixIcon: Icon(Icons.phone, color:kPrimaryColor),
                    filled: true,
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),

                child: TextField(
                  focusNode: emailFocusNode,
                  controller: emailTextFieldController,
                  onEditingComplete: () =>
                      FocusScope.of(context).requestFocus(passwordFocusNode),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.grey[300],
                    hintText: "Email",
                    labelText: "Email",
                    labelStyle: TextStyle(color:kPrimaryColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        style: BorderStyle.solid,
                      ),
                    ),
                    errorText: !validateEmail ? "Email is wrong" : null,
                    prefixIcon: Icon(Icons.email, color:kPrimaryColor),
                    filled: true,
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextField(
                  focusNode: passwordFocusNode,
                  controller: passwordTextFieldController,
                  obscureText: true,
                  onSubmitted: (value) {
                    setState(() {
                      validateEmail =
                          emailTextFieldController.value.text.length > 10;
                      validatePassword =
                          passwordTextFieldController.value.text.length > 6;
                    });
                  },
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.grey[300],
                    hintText: "Password",
                    labelText: "Password",
                    labelStyle: TextStyle(color:kPrimaryColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        style: BorderStyle.solid,
                      ),
                    ),
                    errorText: !validatePassword ? "password is wrong" : null,
                    prefixIcon: Icon(Icons.lock_outline,color:kPrimaryColor),
                    filled: true,
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                  },
                  child: Text('Already have an account ?',textAlign: TextAlign.right,style: TextStyle(color:kPrimaryColor),),

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
                        if(emailTextFieldController.value.text.isNotEmpty
                            && passwordTextFieldController.value.text.isNotEmpty
                            && nameTextFieldController.value.text.isNotEmpty
                            && phoneTextFieldController.value.text.isNotEmpty
                            ){
                            register(
                               nameTextFieldController.value.text,
                              emailTextFieldController.value.text,
                              passwordTextFieldController.value.text,
                                phoneTextFieldController.value.text,)
                              .then((value) {
                            if (value != null) {
                              setState(() {
                                Shared.userObject=value;
                                Center(
                                  child: CircularProgressIndicator(),
                                );
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                              });
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Internet Connection Error')));

                            }
                            });
                        }else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Black Field Not Allowed')));
                        }
                      }
                    ),
                ),
              ),
            ],
          ),
        ),
      ),
        ],
      ),
      ),
    );
  }
}

