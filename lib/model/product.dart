import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:test/model/price.dart';

part 'product.g.dart';

@HiveType(typeId: 3)
class Product {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String image;
  @HiveField(3)
  final List<Price> prices;

  Product(
      {required this.id,
      required this.name,
      required this.image,
      required this.prices});

  factory Product.popularProductFromJson(Map<String, dynamic> data) => Product(
      id: data['id'], name: data['name'], image: data['image'], prices: []);

  factory Product.productFromJson(Map<String, dynamic> data) => Product(
      id: data['id'],
      name: data['name'],
      image: data['image'],
      prices:
          List<Price>.from(data['prices'].map((val) => Price.fromJson(val))));
}

List<Product> popularProductFromJson(String val) => List<Product>.from(json
    .decode(val)['data']['product']
    .map((val) => Product.popularProductFromJson(val)));

List<Product> productListFromJson(String val) => List<Product>.from(json
    .decode(val)['data']['product']['prices']
    .map((val) => Product.productFromJson(val)));
