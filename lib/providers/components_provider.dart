import 'dart:convert';
import "package:flutter/services.dart" show rootBundle;

import 'package:components_demo/shared/models/component.dart';

class ComponentsProvider {

  Future<List<Component>> loadData() async {
    try {
      final rawData = await rootBundle.loadString("data/components.json");
      final List<dynamic> parsedData = jsonDecode(rawData);
      return parsedData.map((entry) {
        return Component.fromJson(Map<String, String>.from(entry));
      }).toList();
    } catch (e) {
      print('Algo malo ocurrió al obtener el json: ${e.toString()}');
      throw e;
    }
  }
}
