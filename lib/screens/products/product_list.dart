import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:makeup_store/apis/products_api.dart';
import 'package:makeup_store/constants/constants.dart';
import 'package:makeup_store/models/product_model.dart';
import 'package:makeup_store/screens/details/detail_screen.dart';


class ProductList extends StatefulWidget {
  String? brand;
  String? productType;

  ProductList({this.brand, this.productType});

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  ProductModel? productObject;

  @override
  void initState() {
    super.initState();
    getProducts(page: 1, brand: widget.brand, productType: widget.productType)
        .then((value) {
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
      appBar: AppBar(
        backgroundColor: kPrimaryLightColor,
        title: Text('Products '),
      ),
      body: productObject == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (BuildContext context, int i) {
                return Card(
                  elevation: 5,
                  shadowColor: kPrimaryLightColor,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetails(
                            productObject!.data![i].name.toString(),
                            productObject!.data![i].brand.toString(),
                            productObject!.data![i].description.toString(),
                            productObject!.data![i].imageLink.toString(),
                            productObject!.data![i].price.toString(),
                            productObject!.data![i].rating.toString(),
                            productObject!.data![i].productColors,
                          ),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.network(
                          productObject!.data![i].imageLink.toString(),
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
                          productObject!.data![i].name.toString(),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: productObject!.data!.length,
              padding: const EdgeInsets.all(16),
              scrollDirection: Axis.vertical,
            ),
    );
  }
}
