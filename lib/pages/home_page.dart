import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fooddelivery/pages/home_view_model.dart';
import 'package:fooddelivery/widgets/my_categories.dart';
import 'package:fooddelivery/widgets/my_orders.dart';
import 'package:stacked/stacked.dart';

import '../model/product.dart';
import 'cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, viewModel, child) => Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: viewModel.bottomNavIndex,
                onTap: (value) {
                 viewModel.setBottomNavIndex(value);
                },
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
                  BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.add_shopping_cart,
                      ),
                      label: ""),
                ],
              ),
              body: SafeArea(
                child: IndexedStack(
                  index: viewModel.bottomNavIndex,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Icon(Icons.location_on),
                                  Text(
                                    "Miami, Florida",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const Icon(Icons.person),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Good morning, Mate",
                                    style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Lets order fresh\nitems for you",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.0),
                              child: Text(
                                "Categories",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //horizontal items
                        Expanded(
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: viewModel.tabs.length,
                                itemBuilder: (context, index) {
                                  return MyCategories(
                                    imagePath: viewModel.tabs[index][1],
                                    color: viewModel.tabs[index][2],
                                    foodGroupName: viewModel.tabs[index][0],
                                    isSelected: viewModel.selectedTab == viewModel.tabs[index][0],
                                    onTap: () {
                                      viewModel.setSelectedTab(viewModel.tabs[index][0]);
                                    },
                                  );
                                })),

                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.0),
                              child: Text(
                                "Select items from below",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          flex: 3,
                          child: ListView.builder(
                              itemCount: viewModel.getFoodForTab(viewModel.selectedTab).length,
                              itemBuilder: (context, index) {
                                Product cart = viewModel.getFoodForTab(viewModel.selectedTab)[index];
                                return MyOrders(
                                  imagePath: cart.imagePath,
                                  color: cart.color,
                                  foodGroup: cart.foodItem,
                                  foodPrice: cart.price,
                                  isSelected: viewModel.selectedFoodOrder == cart.foodItem,
                                  onTap: () {
                                    viewModel.setSelectedOrder(cart.foodItem);
                                    viewModel.addItemToCart(cart);
                                  },
                                );
                              }),
                        ),
                      ],
                    ),
                    CartPage(),
                    CartPage(),
                  ],
                ),
              ),
            ));
  }
}
