import 'package:components_demo/shared/components/appbar_back.dart';
import 'package:flutter/material.dart';

class DropdownPage extends StatefulWidget {
  const DropdownPage({Key key}) : super(key: key);

  @override
  _DropdownPageState createState() => _DropdownPageState();
}

class _DropdownPageState extends State<DropdownPage> {
  String _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack('Dropdown'),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDropdown(),
            ]
          ),
        ),
      )
    );
  }

  Widget _buildDropdown() {
    return DropdownButton(
      hint: Text('Seleccione un valor'),
      value: _selectedValue,
      items: _buildDropdownItems(),
      onChanged: (selected) {
        print('Selected: $selected');
        setState(() {
          _selectedValue = selected;
        });
      },
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownItems() {
    return <Map<String, String>>[
      {
        'label': 'Documento de indentidad',
        'value': 'dni',
      },
      {
        'label': 'Carnet de extranjería',
        'value': 'ce',
      }
    ].map((item) {
      return DropdownMenuItem(
        child: Text(item['label']),
        value: item['value']
      );
    }).toList();
  }
}