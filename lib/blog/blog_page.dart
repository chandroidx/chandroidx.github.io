import 'package:chandroidx/base/base_page.dart';
import 'package:chandroidx/base/main_tab.dart';
import 'package:chandroidx/blog/post.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

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
              itemCount: Post.posts.length,
              itemBuilder: (BuildContext context, int index) {
                return PostWidget(post: Post.posts[index]);
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
