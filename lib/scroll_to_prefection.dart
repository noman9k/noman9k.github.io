import 'package:flutter/material.dart';

class SampleListPage extends StatefulWidget {
  SampleListPage({Key? key}) : super(key: key);

  @override
  State<SampleListPage> createState() => _SampleListPageState();
}

class _SampleListPageState extends State<SampleListPage> {
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          controller: _scrollController,
          itemCount: 7,
          itemBuilder: (context, index) {
            return AnimatedBuilder(
              animation: _scrollController,
              builder: (context, child) => SampleImage(
                imagePath: 'assets/${index + 1}.jpg',
              ),
            );
          }),
    );
  }
}

class SampleImage extends StatelessWidget {
  const SampleImage({Key? key, required this.imagePath}) : super(key: key);
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final renderBox = context.findRenderObject() as RenderBox?;
    final offsetY = renderBox?.localToGlobal(Offset.zero).dy ?? 0;
    final deviceHeight = MediaQuery.of(context).size.height;
    final relativePosition = offsetY / deviceHeight;
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      height: deviceHeight * 0.44,
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
        alignment: Alignment(0, relativePosition - 0.5),
      ),
    );
  }
}
