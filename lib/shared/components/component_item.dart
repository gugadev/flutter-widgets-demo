import 'package:flutter/material.dart';

class ComponentItem extends StatelessWidget {
  final Icon icon;
  final String route;
  final String description;
  final String name;
  final Function onTap;

  const ComponentItem(
      {Key key, this.route, this.description, this.name, this.icon, this.onTap})
      : super(key: key);

  void _onTap() {
    print('Redirecting to $route');
    onTap();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon != null ? icon : Icon(Icons.ac_unit_sharp),
      trailing: Icon(Icons.keyboard_arrow_right),
      title: Text(name),
      // subtitle: Text(description),
      onTap: _onTap,
    );
  }
}
