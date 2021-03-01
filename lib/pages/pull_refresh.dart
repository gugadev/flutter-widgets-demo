import 'dart:async';
import 'dart:math';
import 'package:http/http.dart' as http;

import 'package:components_demo/shared/components/appbar_back.dart';
import 'package:flutter/material.dart';

class PullRefreshPage extends StatefulWidget {
  PullRefreshPage({Key key}) : super(key: key);

  @override
  _PullRefreshPageState createState() => _PullRefreshPageState();
}

class _PullRefreshPageState extends State<PullRefreshPage> with TickerProviderStateMixin {
  final Random _random = Random();

  int _imageId;
  Image _previousImage;

  @override
  void initState() {
    super.initState();
    setState(() {
      _imageId = _random.nextInt(50);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack('Pull Refresh'),
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: _fetchImages,
            child: ListView(
              children: [
                _buildImage(),
                _previousImage != null ? _previousImage : Container(),
              ]
            ),
          ),
        ],
      ),
    );
  }

  Future<Null> _fetchImages() {
    setState(() {
      _imageId = _random.nextInt(50);
    });
    final duration = Duration(seconds: 1, milliseconds: 500);
    return Future.delayed(duration);
  }

  Widget _buildImage() {
    return FutureBuilder(
      // Paste your image URL inside the htt.get method as a parameter
      future: http.get('https://picsum.photos/id/$_imageId/600/1200'),
      builder: (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('Press button to start.');
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Container(
              color: Colors.transparent,
            );
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Text('Error while fetch image. Pull down to retry');
            }
            var _controller = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
            var _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
            _updatePreviousImage(Image.memory(snapshot.data.bodyBytes));
            _startAnimation(_controller);
            return FadeTransition(
              opacity: _animation,
              child: Image.memory(snapshot.data.bodyBytes),
            );
        }
        return null; // unreachable
      },
    );
  }

  void _updatePreviousImage(Image image) {
    _previousImage = image;
  }

  void _startAnimation(AnimationController controller) {
    Timer(Duration(milliseconds: 150), () {
      controller.forward();
    });
  }

}
