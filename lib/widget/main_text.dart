// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class MainText extends StatelessWidget {
  const MainText({Key? key, required this.offset}) : super(key: key);
  final double offset;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -0.35 * offset + 200,
      left: MediaQuery.of(context).size.height * 0.1,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hi, I am Muhammad',
              style: TextStyle(
                  fontSize: 60,
                  fontFamily: 'TTFN-Semi',
                  letterSpacing: -1,
                  color: Colors.white
                  // fontWeight: FontWeight.w300,
                  ),
            ),
            const Text(
              'Noman Zafar',
              style: TextStyle(
                  fontSize: 60,
                  fontFamily: 'TTFN-Semi',
                  letterSpacing: -1,
                  color: Colors.white
                  // fontWeight: FontWeight.w300,
                  ),
            ),
            Row(
              children: [
                const Text(
                  'An',
                  style: TextStyle(
                      fontSize: 60,
                      fontFamily: 'TTFN-Semi',
                      letterSpacing: -1,
                      color: Colors.white
                      // fontWeight: FontWeight.w300,
                      ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Experienced',
                  style: TextStyle(
                      fontFamily: 'TTFN-Bold',
                      inherit: true,
                      fontSize: 48.0,
                      color: Color.fromRGBO(32, 32, 32, 1),
                      shadows: [
                        Shadow(
                            // bottomLeft
                            offset: Offset(-1.5, -1.5),
                            color: Colors.yellow),
                        Shadow(
                            // bottomRight
                            offset: Offset(1.5, -1.5),
                            color: Colors.yellow),
                        Shadow(
                            // topRight
                            offset: Offset(1.5, 1.5),
                            color: Colors.yellow),
                        Shadow(
                            // topLeft
                            offset: Offset(-1.5, 1.5),
                            color: Colors.yellow),
                      ]),
                ),
              ],
            ),
            _buildAnimatedText(),
            // RichText(
            //   text: const TextSpan(
            //     text: 'Flutter Developer',
            //     style: TextStyle(
            //         inherit: true,
            //         fontSize: 40.0,
            //         color: Colors.yellow,
            //         fontFamily: 'TTFN-Bold'),
            //     children: [
            //       TextSpan(text: '.', style: TextStyle(color: Colors.white))
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedText() {
    return SizedBox(
      // width: 250.0,
      child: Row(
        children: [
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: 30.0,
              fontFamily: 'Agne',
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Flutter Dveloper',
                  speed: const Duration(milliseconds: 200),
                  textStyle: const TextStyle(
                      inherit: true,
                      fontSize: 48.0,
                      color: Colors.yellow,
                      fontFamily: 'TTFN-Bold'),
                ),
                TypewriterAnimatedText(
                  speed: const Duration(milliseconds: 200),
                  'Mobile app Dveloper',
                  textStyle: const TextStyle(
                      inherit: true,
                      fontSize: 48.0,
                      color: Colors.yellow,
                      fontFamily: 'TTFN-Bold'),
                ),
                TyperAnimatedText(
                  speed: const Duration(milliseconds: 200),
                  'Web App Dveloper',
                  textStyle: const TextStyle(
                      inherit: true,
                      fontSize: 48.0,
                      color: Colors.yellow,
                      fontFamily: 'TTFN-Bold'),
                ),
              ],
              onTap: () {
                print("Tap Event");
              },
            ),
          ),
          Text('.',
              style: const TextStyle(
                  // inherit: true,
                  fontSize: 48.0,
                  color: Colors.white,
                  fontFamily: 'TTFN-Bold'))
        ],
      ),
    );
  }
}
