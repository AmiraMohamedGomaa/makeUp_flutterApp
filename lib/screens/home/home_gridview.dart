import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:makeup_store/apis/products_api.dart';
import 'package:makeup_store/constants/constants.dart';
import 'package:makeup_store/models/product_model.dart';
import 'package:makeup_store/screens/details/detail_screen.dart';

class HomeGridView extends StatefulWidget {
  const HomeGridView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _CreateHomeGridView createState() => _CreateHomeGridView();
}

class _CreateHomeGridView extends State<HomeGridView> {
  ProductModel? productObject;

  @override
  void initState() {
    final String url = 'https://dart-makeup-store.herokuapp.com/products';
    super.initState();
    getProducts().then((value) {
      if (value != null) {
        setState(() {
          productObject = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: productObject == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.count(
              crossAxisCount: 2,
              children: productObject!.data!
                  .map((item) => Card(
                        elevation: 5,
                        shadowColor: kPrimaryLightColor,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetails(
                                    item.name.toString(),
                                    item.brand.toString(),
                                    item.description.toString(),
                                    item.imageLink.toString(),
                                    item.price.toString(),
                                    item.rating,
                                    item.productColors),
                              ),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.network(
                                item.imageLink.toString(),
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
                                item.productType.toString(),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 14, ),
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
              padding: const EdgeInsets.all(14),
              scrollDirection: Axis.vertical,
            ),
    );
  }
}
