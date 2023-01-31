import 'package:chandroidx/base/base_page.dart';
import 'package:chandroidx/base/main_tab.dart';
import 'package:chandroidx/blog/post.dart';
import 'package:chandroidx/utils/api_utils.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatefulWidget {
  final String? id;

  const BlogPage({super.key, this.id});

  @override
  State<StatefulWidget> createState() => BlogPageState();
}

class BlogPageState extends State<BlogPage> {
  List<Post> _posts = [];

  @override
  void initState() {
    APIUtils.getPosts().then((value) => {
          setState(() {
            _posts = value;
          })
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
        title: '찬드로이드 \u2618️ | 블로그',
        body: Column(
          children: [
            ListView.separated(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _posts.length,
              itemBuilder: (BuildContext context, int index) {
                return PostWidget(post: _posts[index]);
              },
              separatorBuilder: (_, __) {
                return const Divider(
                  height: 100,
                  thickness: 1,
                );
              },
            )
          ],
        ),
        tab: MainTab.blog);
  }
}
