import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:portfolio/type_wrider.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  double x = 0;
  double y = 0;
  double z = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Transform(
          transform: Matrix4(
            1,
            0,
            0,
            0,
            0,
            1,
            0,
            0,
            0,
            0,
            1,
            0,
            0,
            0,
            0,
            1,
          )
            // ..rotateX(x)
            ..rotateY(x),
          // ..rotateZ(z)

          // ..setEntry(3, 2, 0.0001),
          alignment: FractionalOffset.topCenter,
          child: SizedBox(
            height: 400.0,
            width: 400.0,
            child: MouseRegion(
                onHover: (event) => setState(
                      () {
                        log(event.localPosition.toString());
                        y = -event.localPosition.dy / 1000;
                        x = -event.localPosition.dx / 1000;
                        z = event.localPosition.dx / 1500;
                      },
                    ),
                onExit: (event) {
                  Future.delayed(const Duration(milliseconds: 100), () {
                    setState(() {
                      x = 0;
                      y = 0;
                      z = 0;
                    });
                  });
                },
                onEnter: (event) {
                  Future.delayed(const Duration(milliseconds: 100), () {
                    setState(() {
                      x = 0;
                      y = 0;
                      z = 0;
                    });
                  });
                },
                child: AnimatedPhysicalModel(
                    color: Colors.white,
                    elevation: 10,
                    borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.rectangle,
                    animateColor: true,
                    shadowColor: Colors.grey,
                    duration: Duration(milliseconds: 1000),
                    child: Stack(
                      children: [
                        const TypeWriterText(
                            text: Text('Flutter Developer'),
                            duration: Duration(milliseconds: 750)),
                        Image.asset('assets/img.png'),
                      ],
                    ))),
          ),
        ),
      ),
    );
  }
}
