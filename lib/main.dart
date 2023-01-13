import 'package:flutter/material.dart';

import 'base/main_tab.dart';

void main() {
  runApp(const ChandroidXBlog());
}

class ChandroidXBlog extends StatelessWidget {
  const ChandroidXBlog({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: MainTab.home.route, routes: MainTab.routes());
  }
}
