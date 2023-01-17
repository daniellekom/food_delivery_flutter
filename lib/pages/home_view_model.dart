import 'dart:ui';

import 'package:flutter/material.dart';

import '../model/cart.dart';
import 'package:stacked/stacked.dart';



class HomeViewModel extends BaseViewModel{

  List<Cart> cart = [
    Cart('assets/images/fruits.png','Fruits', 12.99),
    Cart('assets/images/vegetables.png','Vegetables', 15.99),
    Cart('assets/images/meats.png','Meats', 60.99),
  ];

  List<List<String>> tabs = [
    ['Fruits','assets/images/fruits.png',],
    ['Vegetables','assets/images/vegetables.png',],
    ['Meats','assets/images/meats.png',],
  ];

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
    return cart.where((element) => element.foodName == tab).toList();
  }






  void initialize(){
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}