import 'dart:convert';

LookupsModel welcomeFromJson(String str) => LookupsModel.fromJson(json.decode(str));

String welcomeToJson(LookupsModel data) => json.encode(data.toJson());

class LookupsModel {
  LookupsModel({
    this.productType,
    this.brands,
  });

  List<ProductType>? productType;
  List<String>? brands;

  factory LookupsModel.fromJson(Map<String, dynamic> json) => LookupsModel(
    productType: List<ProductType>.from(json["productType"].map((x) => ProductType.fromJson(x))),
    brands: List<String>.from(json["brands"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "productType": List<dynamic>.from(productType!.map((x) => x.toJson())),
    "brands": List<dynamic>.from(brands!.map((x) => x)),
  };
}

class ProductType {
  ProductType({
    this.name,
    this.categories,
    this.tags,
  });

  String? name;
  List<String>? categories;
  List<String>? tags;

  factory ProductType.fromJson(Map<String, dynamic> json) => ProductType(
    name: json["name"],
    categories: List<String>.from(json["categories"].map((x) => x)),
    tags: List<String>.from(json["tags"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "categories": List<dynamic>.from(categories!.map((x) => x)),
    "tags": List<dynamic>.from(tags!.map((x) => x)),
  };
}
