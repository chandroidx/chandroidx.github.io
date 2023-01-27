import 'package:chandroidx/blog/category.dart';
import 'package:chandroidx/utils/clickable.dart';
import 'package:chandroidx/utils/colors.dart';
import 'package:chandroidx/utils/fonts.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage(post.thumbnailAsset), context);
    return Clickable(
      onClick: () => {},
      child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraint) {
        final isMobileSize = constraint.maxWidth < 630;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(post.category.title,
                    style: TextStyle(fontFamily: FontFamily.sourceSansPro.fontFamily, fontSize: isMobileSize ? 16 : 17, fontWeight: FontWeight.w600, color: ChandroidColors.primaryColor.color)),
                const SizedBox(height: 10),
                Text(post.title,
                    style: TextStyle(fontFamily: FontFamily.appleSDGothicNeo.fontFamily, fontSize: isMobileSize ? 18 : 22, fontWeight: FontWeight.w700, color: ChandroidColors.textColor.color)),
                const SizedBox(height: 5),
                Text(post.subtitle,
                    style: TextStyle(fontFamily: FontFamily.appleSDGothicNeo.fontFamily, fontSize: isMobileSize ? 15 : 17, fontWeight: FontWeight.normal, color: ChandroidColors.textColor.color)),
                const SizedBox(height: 10),
                Text(post.date,
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
                child: Image.asset(post.thumbnailAsset, width: 200, height: 200),
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
  final Category category;
  final String title;
  final String subtitle;
  final String date;
  final String mdAsset;
  final String thumbnailAsset;
  final String summary;

  Post({required this.id, required this.category, required this.title, required this.subtitle, required this.date, required this.mdAsset, required this.thumbnailAsset, required this.summary});

  static final posts = [
    // Post(
    //   id: "202301261200",
    //   category: Category.blog,
    //   title: '찬드로이드 개발 블로그 \u2618️',
    //   subtitle: '시작하는 아무말',
    //   date: '2023-01-26 12:00',
    //   mdAsset: '',
    //   thumbnailAsset: 'assets/ChandroidX.png',
    //   summary:
    //       '아무렇게나 시작하는 블로그 인생아무렇게나 시작하는 블로그 인생아무렇게나 시작하는 블로그 인생아무렇게나 시작하는 블로그 인생아무렇게나 시작하는 블로그 인생아무렇게나 시작하는 블로그 인생아무렇게나 시작하는 블로그 인생아무렇게나 시작하는 블로그 인생아무렇게나 시작하는 블로그 인생아무렇게나 시작하는 블로그 인생아무렇게나 시작하는 블로그 인생아무렇게나 시작하는 블로그 인생',
    // ),
    // Post(
    //   id: "202301261200",
    //   category: Category.blog,
    //   title: '찬드로이드 개발 블로그 \u2618️',
    //   subtitle: '시작하는 아무말',
    //   date: '2023-01-26 12:00',
    //   mdAsset: '',
    //   thumbnailAsset: 'assets/ChandroidX.png',
    //   summary:
    //       '아무렇게나 시작하는 블로그 인생아무렇게나 시작하는 블로그 인생아무렇게나 시작하는 블로그 인생아무렇게나 시작하는 블로그 인생아무렇게나 시작하는 블로그 인생아무렇게나 시작하는 블로그 인생아무렇게나 시작하는 블로그 인생아무렇게나 시작하는 블로그 인생아무렇게나 시작하는 블로그 인생아무렇게나 시작하는 블로그 인생아무렇게나 시작하는 블로그 인생아무렇게나 시작하는 블로그 인생',
    // )
  ];
}
