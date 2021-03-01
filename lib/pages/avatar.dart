import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar'),
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              // child: Text('GG'),
              backgroundImage: Image.asset('assets/profile-photo.jpg').image,
              // backgroundColor: Color.fromRGBO(52, 73, 94, 1.0),
            )
          )
        ],
      ),
      body: Container(),
    );
  }
}