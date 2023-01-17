import 'package:flutter/material.dart';

class MyOrders extends StatelessWidget {
  final String imagePath;
  final String foodGroup;
  final VoidCallback onTap;
  final bool isSelected;
  final double foodPrice;
  final MaterialColor color;

  const MyOrders({
    Key? key,
    required this.imagePath,
    required this.foodGroup,
    required this.onTap, required this.isSelected,
    required this.foodPrice, required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24),color:isSelected ? color[100] : color[300]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: isSelected? color[100] : color[300],
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Image.asset(
                       imagePath,
                        height: 40,
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
                  foodPrice.toString() + " per lb",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
