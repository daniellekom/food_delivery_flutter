import 'package:flutter/material.dart';

class MyCategories extends StatelessWidget {
  const MyCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.pink[100]),
        child: Row(
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/fruits.png',
                    height: 60,
                  ),
                ),
                Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white),
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: const Text(
                      "Fruits",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
