import 'dart:async';
// import 'dart:math';
import 'package:flutter/material.dart';

import 'package:components_demo/shared/components/appbar_back.dart';

class ListViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<int> _itemIds;
  bool _isLoading = false;
  final ScrollController _controller = new ScrollController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _itemIds = [
        5,
        10,
        15,
        20,
        25,
      ];
    });
    _controller.addListener(() {
      // at the bottom of the page
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        // _addMorePics();
        _fetchPics();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarBack('ListView'),
        body: Stack(children: [
          _createList(),
          _buildLoader(),
        ]));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget _createList() {
    // final random = Random();
    return ListView.builder(
      scrollDirection: Axis.vertical,
      controller: _controller,
      itemCount: _itemIds.length,
      itemBuilder: (BuildContext context, int index) {
        // final photoIndex = random.nextInt(50);
        // print(photoIndex);
        final imageId = _itemIds[index];
        return FadeInImage(
            image: Image.network('https://picsum.photos/id/$imageId/500/300')
                .image,
            placeholder: Image.asset('assets/jar-loading.gif').image,
            key: UniqueKey(),
            height: 250.0,
            fit: BoxFit.cover);
      },
    );
  }

  Widget _buildLoader() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CircularProgressIndicator(),
              )
            ]
          )
        ],
      );
    }
    return Container();
  }

  Timer _fetchPics() {
    setState(() {
      _isLoading = true;
    });
    const duration = Duration(seconds: 2);
    return Timer(duration, () {
      _addMorePics();
      _controller.animateTo(
        _controller.position.pixels + 280,
        curve: Curves.easeInOutCubic,
        duration: Duration(milliseconds: 650)
      );
    });
  }

  void _addMorePics() {
    final lastId = _itemIds[_itemIds.length - 1];
    final List<int> newIds = [];
    for (var i = 1; i <= 5; i++) {
      newIds.add(lastId + (i * 5));
    }
    setState(() {
      _isLoading = false;
      _itemIds.addAll(newIds);
    });
  }
}
