import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeup_store/constants/constants.dart';
import 'package:makeup_store/constants/shared.dart';
import 'package:makeup_store/models/order.dart';
import 'package:makeup_store/models/product_model.dart';
import 'package:makeup_store/screens/cart/cart_screen.dart';


class ProductDetails extends StatelessWidget {
  String name, descriptin, brand, price;
  String imageUrl;
  dynamic rate;
  List<ProductColor>? productColors;
  List<Order>?orders;

  ProductDetails(this.name, this.brand, this.descriptin, this.imageUrl,
      this.price, this.rate, this.productColors);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(


        backgroundColor: Colors.white,
        title: Text(
          brand,
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        ),
        actions: [
          IconButton(icon:Icon(Icons.shopping_cart,color: Colors.black,size: 30,),
            onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>AddToCart())); },),],
      ),
      body: Center(
        child:SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Image.network(
                imageUrl,
                height: 300,
                width: size.width * .99,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.amber,
                    alignment: Alignment.center,
                    child: Text(
                      'Whoops!',
                      style: TextStyle(fontSize: 30),
                    ),
                  );
                },
              ),
              Text(

                name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                descriptin,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Text(
                      "price : ",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      " \$ ",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                         ),
                    ),
                    Text(
                      price,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                         ),
                    ),


                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 60),
                width: size.width * 0.8,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child:ElevatedButton(
                      child: Text(
                        'ADD TO CART',style: TextStyle(color: Colors.white),),
                         style: ElevatedButton.styleFrom(
                          primary: kPrimaryColor,
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20,),
                          textStyle: TextStyle(
                              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
                      onPressed: () {
                        Shared.orderCount++;
                         orders!.add(Order(name: name,price: price,image: imageUrl));
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddToCart(orders: orders)));
                      },

                ),
              ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
