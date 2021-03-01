import 'package:flutter/material.dart';

import 'package:components_demo/shared/components/appbar_back.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack("Alert"),
      body: Center(
          child: RaisedButton(
        child: Text("Show some alert"),
        onPressed: () => _showAlert(context),
        shape: StadiumBorder(),
      )),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(23.0)
          ),
          title: Text('Are you sure you wanna logout?', textAlign: TextAlign.center,),
          titleTextStyle: TextStyle(
            color: Color.fromRGBO(60, 60, 60, 1.0),
            fontSize: 18.0,
            
          ),
          actionsPadding: EdgeInsets.all(0.0),
          content: Column(
            mainAxisSize: MainAxisSize.min, // de lo contrario el diálogo se estira
            children: <Widget>[
              FlutterLogo(size: 80.0,),
            ]
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('I want to stay'),
              onPressed: () {
                // esto es necesario, ya que showDialog crea un sistema de rutas,
                // usando .of() obtenemos el contexto del navigator creado por el dialog
                Navigator.of(context).pop();
              },
              textColor: Colors.grey,
            ),
            FlatButton(
              child: Text('Yes, logout'),
              onPressed: () {},
            )
          ],
        );
      }
    );
  }
}
