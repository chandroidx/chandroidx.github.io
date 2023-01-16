import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'base/main_tab.dart';

void main() {
  setPathUrlStrategy();

  runApp(const ChandroidXBlog());
}

class ChandroidXBlog extends StatelessWidget {
  const ChandroidXBlog({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: MainTab.home.route, routes: MainTab.routes());
  }
}
