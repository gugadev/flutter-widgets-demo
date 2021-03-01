import 'package:components_demo/shared/components/appbar_back.dart';
import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _imageSize = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack('Slider'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
                child: Text('Move the slider to see the effect in the image'),
              ),
              _buildSlider(),
              Expanded(
                child: Center(
                  child: Container(
                    // color: Colors.red,
                    child: _renderImage()
                  ),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }

  Slider _buildSlider() {
    return Slider(
      value: _imageSize,
      min: 50.0,
      max: 250.0,
      onChanged: (value) {
        setState(() {
          _imageSize = value;
        });
      },
    );
  }

  Widget _renderImage() {
    return Image.asset('assets/homer.png',
        height: _imageSize, fit: BoxFit.contain);
  }
}
