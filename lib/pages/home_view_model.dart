import 'dart:ui';

import 'package:flutter/material.dart';

import '../model/cart.dart';
import 'package:stacked/stacked.dart';



class HomeViewModel extends BaseViewModel{

  List<Cart> cart = [
    Cart('assets/images/strawberry.png','Fruits', 3.99,"strawberry",Colors.green),
    Cart('assets/images/banana.png','Fruits', 2.99,"banana",Colors.green),
    Cart('assets/images/grapes.png','Fruits', 4.99,"grapes",Colors.green),
    Cart('assets/images/watermelon.png','Fruits', 6.99,"watermelon",Colors.green),
    Cart('assets/images/apple.png','Fruits', 1.99,"apple",Colors.green),
    Cart('assets/images/tomato.png','Vegetables', 1.99,"tomato",Colors.yellow),
    Cart('assets/images/broccoli.png','Vegetables', 3.99,"broccoli",Colors.yellow),
    Cart('assets/images/purpleonion.png','Vegetables', 3.99,"purple onion",Colors.yellow),
    Cart('assets/images/carrot.png','Vegetables', 2.99,"carrot",Colors.yellow),
    Cart('assets/images/steak.png','Meats', 60.99,"steak",Colors.brown),
    Cart('assets/images/fish.png','Meats', 39.99,"fish",Colors.brown),
    Cart('assets/images/chicken.png','Meats', 25.99,"chicken",Colors.brown),
    Cart('assets/images/salami.png','Meats', 12.99,"salami",Colors.brown),
    Cart('assets/images/bacon.png','Meats', 7.99,"bacon",Colors.brown),
  ];

  final List _tabs = [
    ['Fruits','assets/images/fruits.png',Colors.green],
    ['Vegetables','assets/images/vegetables.png',Colors.yellow],
    ['Meats','assets/images/meats.png',Colors.brown],
  ];
get tabItems => _tabs;

  String? selectedTab;
  String? selectedFoodOrder;

  void setSelectedTab(String tabIclickedOn){
   if(selectedTab == tabIclickedOn){
     selectedTab = null;
   }else{
     selectedTab = tabIclickedOn;
   }
   notifyListeners();
  }

  void setSelectedOrder(String foodIselected){
    if(selectedFoodOrder == foodIselected){
      selectedFoodOrder = null;
    }else{
      selectedFoodOrder = foodIselected;
    }
    notifyListeners();
  }

  List<Cart> getFoodForTab(String? tab){
    return cart.where((element) => element.foodName== tab).toList();
  }






  void initialize(){
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}