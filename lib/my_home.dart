/// Demonstrates playing a one-shot animation on demand

import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class MyRiveAnimation extends StatefulWidget {
  MyRiveAnimation({Key? key}) : super(key: key);

  @override
  _MyRiveAnimationState createState() => _MyRiveAnimationState();
}

class _MyRiveAnimationState extends State<MyRiveAnimation>
    with SingleTickerProviderStateMixin {
  /// Controller for playback
  late RiveAnimationController _controller;

  /// Is the animation currently playing?
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = OneShotAnimation(
      'big',
      autoplay: false,
      onStop: () => setState(() => _isPlaying = false),
      onStart: () => setState(() => _isPlaying = true),
    );
  }

  static const numBehaviours = 9;

  // Particles
  // ParticleType? _particleType = ParticleType.Image;
  Image _image = Image.asset('assets/images/star_stroke.png');

  ParticleOptions particleOptions = ParticleOptions(
    // image: RiveAnimation.asset('assets/light_grid_remix.riv'),
    baseColor: Colors.blue,
    spawnOpacity: 0.0,
    opacityChangeRate: 0.25,
    minOpacity: 0.1,
    maxOpacity: 0.4,
    spawnMinSpeed: 90.0,
    spawnMaxSpeed: 90.0,
    spawnMinRadius: 1.0,
    spawnMaxRadius: 6.0,
    particleCount: 10,
  );

  var particlePaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.0;

  // Lines

  var _lineDirection = LineDirection.Rtl;
  int _lineCount = 50;

  // Bubbles
  BubbleOptions _bubbleOptions = BubbleOptions();

  // General Variables
  int _behaviourIndex = 0;
  Behaviour? _behaviour;

  bool _showSettings = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('One-Shot Example'),
      ),
      body: AnimatedBackground(
        behaviour: RacingLinesBehaviour(direction: _lineDirection),
        vsync: this,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: MouseRegion(
                  cursor: SystemMouseCursors.grab,
                  onExit: (event) => _controller.isActive = false,
                  onEnter: (event) => _controller.isActive = true,
                  onHover: (event) {
                    setState(() {
                      _lineDirection = event.localPosition.dx > 200
                          ? LineDirection.Rtl
                          : LineDirection.Ttb;
                    });
                    print(event.position);
                    print(event.localPosition);
                  },
                  child: Center(
                    child: RiveAnimation.asset(
                      'assets/light_grid_remix.riv',
                      fit: BoxFit.cover,
                      artboard: 'dot',
                      // animations: const ['anim', 'curves'],
                      controllers: [_controller],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // disable the button while playing the animation
        onPressed: () => _isPlaying ? null : _controller.isActive = true,
        tooltip: 'Play',
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }
  // Behaviour _buildBehaviour() {
  //   switch (_behaviourIndex) {
  //     case 0:
  //       return RandomParticleBehaviour(
  //         options: particleOptions,
  //         paint: particlePaint,
  //       );
  //     case 1:
  //       return RainParticleBehaviour(
  //         options: particleOptions,
  //         paint: particlePaint,
  //         enabled: !_showSettings,
  //       );
  //     case 2:
  //       return RectanglesBehaviour();
  //     case 3:
  //       return RacingLinesBehaviour(
  //         direction: _lineDirection,
  //         numLines: _lineCount,
  //       );
  //     case 4:
  //       return BubblesBehaviour(
  //         options: _bubbleOptions,
  //       );
  //     case 5:
  //       return SpaceBehaviour();
  //   }

  //   return RandomParticleBehaviour(
  //     options: particleOptions,
  //     paint: particlePaint,
  //   );
  // }

}
