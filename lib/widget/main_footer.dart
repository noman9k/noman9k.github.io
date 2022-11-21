import 'package:flutter/material.dart';

class MainFooter extends StatelessWidget {
  const MainFooter({super.key, required this.offset});
  final double offset;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      left: 0,
      top: -0.95 * offset + MediaQuery.of(context).size.height * 2,
      child: Container(
        height: 200,
        width: 200,
        color: Colors.blue,
      ),
    );
  }
}
