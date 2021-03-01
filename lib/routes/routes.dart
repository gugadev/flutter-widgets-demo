import 'package:flutter/material.dart';

import 'package:components_demo/pages/pull_refresh.dart';
import 'package:components_demo/pages/listview.dart';
import 'package:components_demo/pages/checkbox.dart';
import 'package:components_demo/pages/dropdown.dart';
import 'package:components_demo/pages/slider.dart';
import 'package:components_demo/pages/input.dart';
import 'package:components_demo/pages/animated_container.dart';
import 'package:components_demo/pages/card.dart';
import 'package:components_demo/pages/alert.dart';
import 'package:components_demo/pages/avatar.dart';
import 'package:components_demo/pages/home.dart';

final Map<String, WidgetBuilder> appRoutes = {
  "/": (BuildContext context) {
    return HomePage();
  },
  "/alert": (BuildContext context) {
    return AlertPage();
  },
  "/avatar": (BuildContext context) {
    return AvatarPage();
  },
  '/card': (BuildContext context) {
    return CardPage();
  },
  '/animated-container': (BuildContext context) {
    return AnimatedContainerPage();
  },
  '/input': (BuildContext context) {
    return InputPage();
  },
  '/dropdown': (BuildContext context) {
    return DropdownPage();
  },
  '/slider': (BuildContext context) {
    return SliderPage();
  },
  '/checkbox': (BuildContext context) {
    return CheckboxPage();
  },
  '/listview': (BuildContext context) {
    return ListViewPage();
  },
  '/pull-refresh': (BuildContext context) {
    return PullRefreshPage();
  }
};
