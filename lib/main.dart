import 'package:components_demo/pages/404.dart';
import 'package:flutter/material.dart';

import 'package:components_demo/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Components App',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: appRoutes,
      onGenerateRoute: (RouteSettings settings) {
        print('Llamada a ruta desconocida: ${settings.name}');
        return MaterialPageRoute(builder: (BuildContext context) {
          return NotFoundPage();
        });
      },
      theme: ThemeData(
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
          color: Color.fromRGBO(252, 12, 0, 1.0),
        )
      ),
    );
  }
}
