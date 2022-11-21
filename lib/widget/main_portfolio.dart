import 'package:flutter/material.dart';

class MainPortfolio extends StatelessWidget {
  const MainPortfolio({super.key, required this.offset});
  final double offset;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: -0.85 * offset + MediaQuery.of(context).size.height,
        right: 0,
        left: 0,
        bottom: 0,
        child: Container(
          color: Colors.red,
          height: 200,
          width: 200,
          child: Text('Hello'),
        ));
  }
}
