import 'package:flutter/material.dart';

import 'package:portfolio/goodWraper.dart';
import 'package:portfolio/index.dart';
import 'package:portfolio/web_demo.dart';

import 'cuberto.dart';
import 'scroll_to_prefection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: const MaterialColor(0xFF202020, <int, Color>{
          50: Color(0xFFE4E4E4),
          100: Color(0xFFBCBCBC),
          200: Color(0xFF909090),
          300: Color(0xFF636363),
          400: Color(0xFF414141),
          500: Color(0xFF202020),
          600: Color(0xFF1C1C1C),
          700: Color(0xFF181818),
          800: Color(0xFF131313),
          900: Color(0xFF0B0B0B),
        }),
        fontFamily: 'Wave-Bold',
      ),
      home: const LandingPage(),
      // home: Cuberto(),
    );
  }
}
