import 'package:flutter/material.dart';

class TotalPage extends StatelessWidget {
  const TotalPage({
    Key? key,
    required this.total,
  }) : super(key: key);

  final String total;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text("Your total is: $total"),
    ));
  }
}
