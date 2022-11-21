import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class MainImage extends StatelessWidget {
  const MainImage({Key? key, required this.offset}) : super(key: key);
  final double offset;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: -0.85 * offset + 70,
        right: 1,
        bottom: 0,
        child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                      width: 700,
                      height: 700,
                      child: RiveAnimation.asset('assets/images/riv/ring.riv')),
                ),
                Align(
                    alignment: Alignment.center,
                    child: Image.asset('assets/1024 (2) 1 (1).png',
                        fit: BoxFit.fill)),
              ],
            )));
  }
}
