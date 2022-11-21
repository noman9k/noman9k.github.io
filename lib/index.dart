// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:portfolio/responsive/dimensions.dart';
import 'package:portfolio/widget/header.dart';
import 'package:portfolio/widget/main_footer.dart';
import 'package:portfolio/widget/main_image.dart';
import 'package:rive/rive.dart';

import 'widget/main_portfolio.dart';
import 'widget/main_text.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late ScrollController _scrollController;
  late ScreenSize _screenSize;
  double get screenHeight => MediaQuery.of(context).size.height;
  double get screenWidth => MediaQuery.of(context).size.width;
  double get offset =>
      _scrollController.hasClients ? _scrollController.offset : 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {});
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _screenSize = getScreenSize(screenWidth);
    return Scaffold(
      backgroundColor: Color.fromRGBO(32, 32, 32, 1),
      body: Stack(
        children: [
          // Top Right Circle
          Positioned(
            right: -95,
            top: -85,
            child: SizedBox(
              width: 350,
              height: 300,
              child: RiveAnimation.asset('assets/images/riv/ring.riv'),
            ),
          ),
          // Bottum left Circle
          Positioned(
            left: -95,
            bottom: -85,
            child: SizedBox(
                width: 350,
                height: 300,
                child: RiveAnimation.asset('assets/images/riv/ring.riv')),
          ),
          // My Image

          MainImage(offset: offset),
          MainText(offset: offset),
          MainPortfolio(offset: offset),

          MainFooter(offset: offset),

          Scrollbar(
            child: ListView(
              controller: _scrollController,
              cacheExtent: screenHeight * 1,
              children: [
                Container(
                  height: screenHeight,
                  // color: Colors.orange.withOpacity(0.1),
                ),
                // Image.asset(
                //   'assets/11.png',
                //   fit: BoxFit.cover,
                //   alignment: const Alignment(0, -0.2),
                // ),

                Container(
                  height: screenHeight * 2,
                  color: Colors.blue.withOpacity(0.1),
                  // child: SizedBox(child: MyHeader()),
                  // child: ,
                ),
              ],
            ),
          ),

          _screenSize == ScreenSize.mobile ? Container() : MyHeader(),

          Text(screenWidth.toString() + ' ' + _screenSize.toString()),
        ],
      ),
    );
  }
}
