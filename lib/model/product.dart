import 'package:flutter/src/material/colors.dart';

enum ProductCategory { meats, vegetables, fruits }

class Product {
  final String imagePath;
  final ProductCategory category;
  final double price;
  final String foodItem;
  final MaterialColor color;


  Product(
    this.imagePath,
    this.category,
    this.price,
    this.foodItem,
    this.color,

  );
}
