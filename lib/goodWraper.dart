// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:provider/provider.dart';

class MyGridView extends StatelessWidget {
  MyGridView({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _scrollController,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0.1),
          title: const Text('Good Wraper'),
        ),
        body: GridView.builder(
          controller: _scrollController,
          itemCount: imageList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) => SizedBox(
            height: 200,
            child: Consumer<ScrollController>(
              builder: (context, controller, child) => AnimatedBuilder(
                animation: controller,
                builder: (context, child) => GoodWraper(
                  isLastChild: index == imageList.length - 1,
                  child: Image.asset(
                    imageList[index],
                    fit: BoxFit.cover,
                    // alignment: Alignment(0, relativePosition - 0.5),
                  ),
                ),
              ),
              // child: GoodWraper(
              //   child: SampleImage(
              //     imagePath: imageList[index],
              //   ),
              // ),
            ),
          ),
        ),
      ),
    );
  }
}

class GoodWraper extends StatelessWidget {
  GoodWraper({
    Key? key,
    required this.child,
    this.isLastChild = false,
  }) : super(key: key);
  final Widget child;
  bool isLastChild = false;

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final renderBox = context.findRenderObject() as RenderBox?;
    final offsetY = renderBox?.localToGlobal(Offset.zero).dy ?? 0;
    final widgetHeight = renderBox?.size.height ?? 0;
    // final relativePosition = offsetY / deviceHeight;
    final heightVisible = deviceHeight - offsetY;
    final howMuchVisible = (heightVisible / widgetHeight).clamp(0, 1);

    final scale = 0.75 + howMuchVisible * 0.25;
    final opacity = 0.25 + howMuchVisible * 0.75;

    if (offsetY <= 0) {
      return SizedBox(
        height: 200,
        child: child,
      );
    }

    return Transform.scale(
      alignment: Alignment.bottomRight,
      scale: scale,
      child: Opacity(
        opacity: opacity,
        child: child,
      ),
    );
  }
}
