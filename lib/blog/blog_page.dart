import 'package:chandroidx/base/base_page.dart';
import 'package:chandroidx/base/main_tab.dart';
import 'package:flutter/cupertino.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: '찬드로이드 ☘ | 블로그',
      body: Container(),
      tab: MainTab.blog
    );
  }
}
