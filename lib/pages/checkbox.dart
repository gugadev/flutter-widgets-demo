import 'package:components_demo/shared/components/appbar_back.dart';
import 'package:flutter/material.dart';

class CheckboxPage extends StatefulWidget {
  CheckboxPage({Key key}) : super(key: key);

  @override
  _CheckboxPageState createState() => _CheckboxPageState();
}

class _CheckboxPageState extends State<CheckboxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack('Checkbox'),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Text(
                'Normal checkboxes',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.teal
                )
              ),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (checked) {},
                  ),
                  Checkbox(
                    value: true,
                    onChanged: (checked) {},
                    activeColor: Colors.pink,
                  )
                ]
              ),
              SizedBox(height: 20.0),
              Text(
                'CheckboxListTile',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple
                )
              ),
              CheckboxListTile(
                value: true,
                onChanged: (value) {},
                title: Text('Example'),
              ),
              SizedBox(height: 20.0),
              Text(
                'SwitchListTile',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange
                )
              ),
              SwitchListTile(
                value: true,
                onChanged: (value) {},
                title: Text('Example'),
                subtitle: Text('subtitle'),
              )
            ],
          )
        ),
      )
    );
  }
}