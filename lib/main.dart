import 'package:chandroidx/firebase_options.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'base/main_tab.dart';

final router = FluroRouter();

void main() async {
  for (var element in MainTab.values) {
    var handler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return element.navigationRoute;
    });
    router.define(element.route, handler: handler);
  }

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const ChandroidXBlog());
}

class ChandroidXBlog extends StatelessWidget {
  const ChandroidXBlog({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: MainTab.home.route, routes: MainTab.routes());
  }
}
