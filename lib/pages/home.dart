import 'package:flutter/material.dart';

import 'package:components_demo/providers/components_provider.dart';
import 'package:components_demo/shared/components/component_item.dart';
import 'package:components_demo/shared/models/component.dart';

class HomePage extends StatelessWidget {
  final ComponentsProvider _provider = ComponentsProvider();

  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Component list")
      ),
      body: Container(
        child: _createList(),
      ),
    );
  }

  Widget _createList() {
    return FutureBuilder<List<Component>>(
      future: _provider.loadData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView(children: _createListItems(context, snapshot.data));
        }
        if (snapshot.hasError) {
          return Container();
        }
        return CircularProgressIndicator();
      },
    );
  }

  List<Widget> _createListItems(BuildContext context, List<Component> data) {
    return data.map((c) {
      return Column(children: [
        ComponentItem(
          name: c.name,
          route: c.route,
          description: c.description,
          onTap: () {
            Navigator.pushNamed(context, c.route);
          },
        ),
        Divider(height: 0)
      ]);
    }).toList();
  }
}
