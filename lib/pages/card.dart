import 'package:components_demo/shared/components/appbar_back.dart';
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack("Card"),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          _simpleCard(),
          SizedBox(height: 8.0),
          _mediaCard(),
        ]
      )
    );
  }

  Widget _simpleCard() {
    return Card(  
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(23.0))
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text("Photo album"),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text("This a description about some photo album. Made it just for educational purposes."),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text("Cancel"),
                onPressed: () {},
                textColor: Colors.grey,
              ),
              FlatButton(
                child: Text("OK"),
                textColor: Colors.blue,
                onPressed: () {},
              )
            ]
          )
        ]
      ),
    );
  }

  Widget _mediaCard() {
    return Card(
      clipBehavior: Clip.antiAlias, // avoid overflow of content
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(23.0))
      ),
      child: Column(
        children: [
          FadeInImage(
            image: Image.network('https://i.imgur.com/D3fOGRN.jpg').image,
            placeholder: Image.asset('assets/jar-loading.gif').image,
            fadeInDuration: Duration(milliseconds: 200),
            height: 200,
            width: 400,
            fit: BoxFit.cover
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('iPad Pro wallper')
          )
        ]
      )
    );
  }

}