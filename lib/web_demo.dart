import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

class WebDemo extends StatefulWidget {
  const WebDemo({Key? key}) : super(key: key);

  @override
  State<WebDemo> createState() => _WebDemoState();
}

class _WebDemoState extends State<WebDemo> {
  late ScrollController _scrollController;
  // double get _scrollOffset => _scrollController.offset;
  double get screenHeight => MediaQuery.of(context).size.height;
  double get screenWidth => MediaQuery.of(context).size.width;
  double get offset =>
      _scrollController.hasClients ? _scrollController.offset : 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log('offset: $offset');
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: -0.35 * offset,
            child: ImageNetwork(
              image:
                  "https://images.unsplash.com/photo-1502582877126-512f3c5b0a64?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1738&q=80",
              imageCache: const CachedNetworkImageProvider(
                  "https://images.unsplash.com/photo-1502582877126-512f3c5b0a64?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1738&q=80"),
              height: MediaQuery.of(context).size.width * 0.55,
              width: MediaQuery.of(context).size.width,
              duration: 1500,
              curve: Curves.easeIn,
              onPointer: true,
              debugPrint: false,
              fullScreen: true,
              fitAndroidIos: BoxFit.cover,
              fitWeb: BoxFitWeb.cover,
              // borderRadius: BorderRadius.circular(70),
              onLoading: const CircularProgressIndicator(
                color: Colors.indigoAccent,
              ),
              onError: const Icon(
                Icons.error,
                color: Colors.red,
              ),
              onTap: () {
                debugPrint("©gabriel_patrick_souza");
              },
            ),
          ),
          Positioned(
            top: screenHeight * 0.25 - 0.50 * offset,
            right: 0,
            left: 0,
            height: screenHeight * 0.7,
            child: RepaintBoundary(
              child: Image.asset(
                'assets/11.png',
                fit: BoxFit.cover,
                alignment: const Alignment(0, -0.2),
              ),
            ),
          ),
          Header(),
          Scrollbar(
            child: ListView(
              controller: _scrollController,
              cacheExtent: screenHeight * 1,
              children: [
                Container(
                  height: screenHeight,
                  // color: Colors.orange.withOpacity(0.1),
                ),
                Container(
                  height: screenHeight * 6,
                  color: Colors.white,
                ),
                Image.asset(
                  'assets/11.png',
                  fit: BoxFit.cover,
                  alignment: const Alignment(0, -0.2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget Header() {
  return Positioned(
    top: 0.0,
    right: 0.0,
    left: 0.0,
    child: Wrap(
      children: [
        Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                )
              ],
              border:
                  Border.all(color: Colors.white.withOpacity(0.2), width: 1.0),
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
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child:
                    // Image.asset(
                    //   'assets/images/icons/Logo.png',
                    //   fit: BoxFit.cover,
                    // )

                    Text(
                  "Noman.",
                  style: TextStyle(
                      fontSize: 90,
                      foreground: Paint()
                        ..color = Colors.yellow
                        ..strokeWidth = -0.5
                        ..style = PaintingStyle.stroke,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "Home",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      "About",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      "Contact",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
