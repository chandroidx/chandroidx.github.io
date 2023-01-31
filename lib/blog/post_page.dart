import 'package:chandroidx/base/base_page.dart';
import 'package:chandroidx/base/main_tab.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  final String postId;

  const PostPage({super.key, required this.postId});

  @override
  State<StatefulWidget> createState() => PostPageState();
}

class PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage(title: '123', body: Container(), tab: MainTab.blog);
  }
}
