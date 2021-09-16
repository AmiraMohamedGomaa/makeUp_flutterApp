import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeup_store/constants/constants.dart';
import 'package:makeup_store/constants/shared.dart';
import 'package:makeup_store/models/lookups_model.dart';
import 'package:makeup_store/screens/home/home_gridview.dart';
import 'package:makeup_store/screens/products/product_list.dart';

class HomeScreen extends StatefulWidget {
  LookupsModel? lookupsObject=Shared.lookupsObject;
  HomeScreen();

  _CreateHomeScreen createState() => _CreateHomeScreen();
}

class _CreateHomeScreen extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 5)),
              Text(
                "Brands",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: size.height * .12,
                width: size.width * .90,
                child: ListView.builder(
                  padding: EdgeInsets.all(5.0),
                  itemCount: Shared.lookupsObject!.brands!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    child: Container(
                      height: size.height * .12,
                      width: size.width * .25,
                      margin: EdgeInsets.all(5.0),
                      color: kPrimaryLightColor,
                      alignment: Alignment.center,
                      child: Text(
                        widget.lookupsObject!.brands![index],
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductList(brand:widget.lookupsObject!.brands![index].toString(),)),
                      );
                    },
                  ),
                ),
              ),
              Text(
                "Products Types",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: size.height * .12,
                width: size.width * .90,
                child: ListView.builder(
                  padding: EdgeInsets.all(5.0),
                  itemCount: widget.lookupsObject!.productType!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    child: Container(
                      height: size.height * .12,
                      width: size.width * .25,
                      margin: EdgeInsets.all(5.0),
                      color: kPrimaryLightColor,
                      alignment: Alignment.center,
                      child: Text(
                        widget.lookupsObject!.productType![index].name.toString(),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductList(productType:widget.lookupsObject!.productType![index].name.toString(),)),
                      );
                    },
                  ),
                ),
              ),
              Text(
                "Menu",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 500,
                child: HomeGridView(
                  title: 'home screen',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
