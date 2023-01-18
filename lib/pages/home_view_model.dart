import 'dart:ui';

import 'package:flutter/material.dart';

import '../model/product.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  // Navigation for bottom nav

  int bottomNavIndex = 0;
  String? selectedTab;
  String? selectedFoodOrder;

  List<Product> items = [
    Product('assets/images/strawberry.png', ProductCategory.fruits, 3.99, "strawberry", Colors.green),
    Product('assets/images/banana.png', ProductCategory.fruits, 2.99, "banana", Colors.green),
    Product('assets/images/grapes.png', ProductCategory.fruits, 4.99, "grapes", Colors.green),
    Product('assets/images/watermelon.png', ProductCategory.fruits, 6.99, "watermelon", Colors.green),
    Product('assets/images/apple.png', ProductCategory.fruits, 1.99, "apple", Colors.green),
    Product('assets/images/tomato.png', ProductCategory.vegetables, 1.99, "tomato", Colors.yellow),
    Product('assets/images/broccoli.png', ProductCategory.vegetables, 3.99, "broccoli", Colors.yellow),
    Product('assets/images/purpleonion.png', ProductCategory.vegetables, 3.99, "purple onion", Colors.yellow),
    Product('assets/images/carrot.png', ProductCategory.vegetables, 2.99, "carrot", Colors.yellow),
    Product('assets/images/steak.png', ProductCategory.meats, 60.99, "steak", Colors.brown),
    Product('assets/images/fish.png', ProductCategory.meats, 39.99, "fish", Colors.brown),
    Product('assets/images/chicken.png', ProductCategory.meats, 25.99, "chicken", Colors.brown),
    Product('assets/images/salami.png', ProductCategory.meats, 12.99, "salami", Colors.brown),
    Product('assets/images/bacon.png', ProductCategory.meats, 7.99, "bacon", Colors.brown),
  ];

  final List tabs = [
    ['Fruits', 'assets/images/fruits.png', Colors.green],
    ['Vegetables', 'assets/images/vegetables.png', Colors.yellow],
    ['Meats', 'assets/images/meats.png', Colors.brown],
  ];

  List<Product> cart = [];

  void setBottomNavIndex(int index) {
    bottomNavIndex = index;
    notifyListeners();
  }

// get tabItems => _tabs;

// get cartItems => cart

  // add item to cart
  void addItemToCart(Product product) {
    cart.add(product);
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    cart.removeAt(index);
    notifyListeners();
  }

  //calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cart.length; i++) {
      totalPrice += (cart[i].price);
    }
    return totalPrice.toStringAsFixed(2);
  }

  void setSelectedTab(String tabIclickedOn) {
    if (selectedTab == tabIclickedOn) {
      selectedTab = null;
    } else {
      selectedTab = tabIclickedOn;
    }
    notifyListeners();
  }

  void setSelectedOrder(String foodIselected) {
    if (selectedFoodOrder == foodIselected) {
      selectedFoodOrder = null;
    } else {
      selectedFoodOrder = foodIselected;
    }
    notifyListeners();
  }

  List<Product> getFoodForTab(String? tab) {
    return items.where((element) => element.category.name == tab?.toLowerCase()).toList();
  }

  void initialize() {}

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
