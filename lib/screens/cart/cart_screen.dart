import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeup_store/constants/constants.dart';
import 'package:makeup_store/constants/shared.dart';
import 'package:makeup_store/models/order.dart';

class AddToCart extends StatefulWidget {
  List<Order>?orders;

   AddToCart({ this.orders});

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryLightColor,
        title: Text('Order List '),
      ),
      body:ListView.builder(
        itemBuilder: (BuildContext context, int i) {
          return Card(
            elevation: 5,
            shadowColor: kPrimaryLightColor,
            child: GestureDetector(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.network(
                    widget.orders![i].image.toString(),
                    fit: BoxFit.cover,
                    height: 70,
                    width: 130,
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
                    widget.orders![i].name.toString(),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 14),
                  ),
                  Text(
                    "price : \$"+widget.orders![i].price.toString(),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: widget.orders!.length,
        padding: const EdgeInsets.all(16),
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
