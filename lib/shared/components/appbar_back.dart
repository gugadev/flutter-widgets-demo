import 'package:flutter/material.dart';

class AppBarBack extends PreferredSize {
  final double height = kToolbarHeight;
  final String title;

  AppBarBack(this.title);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(title),
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }
}
