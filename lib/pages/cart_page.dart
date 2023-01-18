import 'package:flutter/material.dart';
import 'package:fooddelivery/model/product.dart';
import 'package:fooddelivery/pages/home_view_model.dart';
import 'package:fooddelivery/pages/total_page.dart';
import 'package:stacked/stacked.dart';

class CartPage extends ViewModelWidget<HomeViewModel> {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: viewModel.cart.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
                    child: ListTile(
                      leading: Image.asset(
                        viewModel.cart[index].imagePath,
                        height: 36,
                      ),
                      title: Text(
                        viewModel.cart[index].foodItem,
                        style: const TextStyle(fontSize: 18),
                      ),
                      subtitle: Text(
                        '\$' + viewModel.cart[index].price.toString(),
                        style: TextStyle(fontSize: 12),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.cancel),
                        onPressed: () => viewModel.removeItemFromCart(index),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.orange),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Total amount"),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(viewModel.calculateTotal())
                      ],
                    ),
                    DecoratedBox(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.deepPurple),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return  TotalPage(total: viewModel.calculateTotal(),);
                                  },
                                ));
                              },
                              child: const Text("Pay Now")),
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
