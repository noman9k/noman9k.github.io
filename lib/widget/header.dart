// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class MyHeader extends StatelessWidget {
  const MyHeader({Key? key}) : super(key: key);

  static final List<String> headerTexts = ['Home', 'Portfolio', 'Contact'];

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0.0,
      right: 0.0,
      left: 0.0,
      child: Wrap(
        alignment: WrapAlignment.end,
        children: [
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.25))],
                border: Border.all(
                    color: Colors.white.withOpacity(0.2), width: 1.0),
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.5),
                    Colors.white.withOpacity(0.2)
                  ],
                  stops: const [0.0, 1.0],
                ),
                borderRadius: BorderRadius.circular(0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30.0,
                  ),
                  child: _logo(),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50.0),
                  child: Expanded(
                    child: Wrap(
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.end,
                      children: headerTexts.map((e) => _headerText(e)).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _headerText(String text) {
  return Padding(
    padding: const EdgeInsets.only(
      right: 40,
    ),
    child: GestureDetector(
      onTap: () {
        switch (text) {
          case 'Home':
            print('Go To Home');
            break;

          case 'Portfolio':
            print('Go To Portfolio');

            break;
          case 'Contact':
            print('Go To Contact');

            break;
        }
      },
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget _logo() {
  return InkWell(
    hoverColor: Colors.grey,
    // ignore: avoid_print
    onTap: () => print('Reload Page'),
    child: RichText(
      text: const TextSpan(
        text: 'Noman',
        style: TextStyle(
            inherit: true,
            fontSize: 48.0,
            color: Colors.white,
            fontFamily: 'TTFN-Bold'),
        children: [TextSpan(text: '.', style: TextStyle(color: Colors.yellow))],
      ),
    ),
  );
}




///: Text Style

//  style: 
                    
//                     TextStyle(
//                         fontSize: 90,
//                         foreground: Paint()
//                           ..color = Colors.yellow
//                           ..strokeWidth = -0.5
//                           ..style = PaintingStyle.stroke,
//                         fontWeight: FontWeight.bold),