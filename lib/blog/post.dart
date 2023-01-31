import 'package:chandroidx/main.dart';
import 'package:chandroidx/utils/clickable.dart';
import 'package:chandroidx/utils/colors.dart';
import 'package:chandroidx/utils/fonts.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    precacheImage(NetworkImage(post.thumbnailUrl), context);
    return Clickable(
      onClick: () => {router.navigateTo(context, 'blog/${post.id}', transition: TransitionType.none)},
      child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraint) {
        final isMobileSize = constraint.maxWidth < 630;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(post.category,
                    style: TextStyle(fontFamily: FontFamily.sourceSansPro.fontFamily, fontSize: isMobileSize ? 16 : 17, fontWeight: FontWeight.w600, color: ChandroidColors.primaryColor.color)),
                const SizedBox(height: 10),
                Text(post.title,
                    style: TextStyle(fontFamily: FontFamily.appleSDGothicNeo.fontFamily, fontSize: isMobileSize ? 18 : 22, fontWeight: FontWeight.w700, color: ChandroidColors.textColor.color)),
                const SizedBox(height: 5),
                Text(post.subtitle,
                    style: TextStyle(fontFamily: FontFamily.appleSDGothicNeo.fontFamily, fontSize: isMobileSize ? 15 : 17, fontWeight: FontWeight.normal, color: ChandroidColors.textColor.color)),
                const SizedBox(height: 10),
                Text(DateFormat('yyyy-MM-dd hh:mm').format(post.date),
                    style: TextStyle(
                        fontFamily: FontFamily.appleSDGothicNeo.fontFamily, fontSize: isMobileSize ? 14 : 16, fontWeight: FontWeight.normal, color: const Color.fromARGB(255, 144, 148, 154))),
                const SizedBox(height: 30),
                Text(
                  post.summary,
                  style: TextStyle(
                      fontFamily: FontFamily.appleSDGothicNeo.fontFamily,
                      fontSize: isMobileSize ? 14 : 15,
                      fontWeight: FontWeight.normal,
                      color: const Color.fromARGB(255, 144, 148, 154),
                      height: 1.5),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            )),
            const SizedBox(width: 50),
            Visibility(
              visible: !isMobileSize,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(post.thumbnailUrl, width: 200, height: 200),
              ),
            )
          ],
        );
      }),
    );
  }
}

class Post {
  final String id;
  final String category;
  final String title;
  final String subtitle;
  final DateTime date;
  final String content;
  final String thumbnailUrl;
  final String summary;

  Post({required this.id, required this.category, required this.title, required this.subtitle, required this.date, required this.content, required this.thumbnailUrl, required this.summary});

  factory Post.fromJson(dynamic json) {
    return Post(
      id: json['id'],
      category: json['category'],
      title: json['title'],
      subtitle: json['subtitle'],
      date: DateTime.parse(json['reg_date']),
      content: json['content'],
      thumbnailUrl: json['thumbnail_url'],
      summary: json['summary'],
    );
  }
}
