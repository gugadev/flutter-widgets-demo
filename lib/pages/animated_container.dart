import 'dart:math';

import 'package:components_demo/shared/components/appbar_back.dart';
import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  AnimatedContainerPage({Key key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _height = 50.0;
  double _width = 50.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _radius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack('Animated Container'),
      body: Container(
        color: Colors.white,
        child: Center(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 750),
            curve: Curves.easeInOut,
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              borderRadius: _radius,
              color: _color,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: _playAnimation,
        backgroundColor: Colors.black,
      ),
    );
  }

  void _playAnimation() {
    final random = Random();
    setState(() {
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
        1.0,
      );
    });
  }
}
