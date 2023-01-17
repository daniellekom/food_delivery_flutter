import 'package:flutter/material.dart';

class MyOrders extends StatelessWidget {
  final String imagePath;
  final String foodGroup;
  final VoidCallback onTap;
  final bool isSelected;
  final double foodPrice;


  const MyOrders({
    Key? key,
    required this.imagePath,
    required this.foodGroup,
    required this.onTap, required this.isSelected,
    required this.foodPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: isSelected? Colors.pink[100] : Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                     imagePath,
                      height: 40,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                 Text(
                  foodGroup,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              foodPrice.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );

  }
}
