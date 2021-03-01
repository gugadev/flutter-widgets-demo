import 'package:flutter/material.dart';

import 'package:components_demo/shared/components/appbar_back.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack("Not Found"),
      body: Text("Page not found"),
    );
  }
}