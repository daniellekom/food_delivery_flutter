import 'package:flutter/material.dart';

class MyCategories extends StatelessWidget {
  final imagePath;
  final bool isSelected;
  final VoidCallback onTap;
  final foodGroupName;
  final MaterialColor color;


  const MyCategories({
    Key? key,
    required this.imagePath,
    required this.foodGroupName,
    required this.isSelected,
    required this.onTap,
   required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isSelected ? color[300] : color[100]
          ),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      imagePath,
                      height: 60,
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white),
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                      child:  Text(
                        foodGroupName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
