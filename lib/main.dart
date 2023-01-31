import 'package:chandroidx/blog/post_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'base/main_tab.dart';

final router = FluroRouter();

void main() async {
  for (var element in MainTab.values) {
    router.define(element.route, handler: Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) => element.navigationRoute));
  }

  router.define('${MainTab.blog.route}/:id', handler: Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return PostPage(postId: params['id']![0]);
  }));

  runApp(const ChandroidXBlog());
}

class ChandroidXBlog extends StatelessWidget {
  const ChandroidXBlog({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: MainTab.home.route, onGenerateRoute: router.generator);
  }
}
