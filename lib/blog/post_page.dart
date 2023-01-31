import 'package:chandroidx/base/base_page.dart';
import 'package:chandroidx/base/footer/footer.dart';
import 'package:chandroidx/base/main_tab.dart';
import 'package:chandroidx/blog/post.dart';
import 'package:chandroidx/utils/api_utils.dart';
import 'package:chandroidx/utils/colors.dart';
import 'package:chandroidx/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostPage extends StatefulWidget {
  final String postId;

  const PostPage({super.key, required this.postId});

  @override
  State<StatefulWidget> createState() => PostPageState();
}

class PostPageState extends State<PostPage> {
  Post? _post;

  @override
  void initState() {
    APIUtils.getPostDetail(widget.postId).then((value) => {
          setState(() {
            _post = value;
          })
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_post != null) {
      return Title(
        color: Colors.black,
        title: _post!.title,
        child: Material(
          color: Colors.white,
          child: SingleChildScrollView(
            child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
              final isMobileSize = constraints.maxWidth < 630;

              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        constraints: const BoxConstraints(maxWidth: 1000),
                        child: Column(
                          children: const [
                            MainTabContainer(tab: MainTab.blog),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Image.network(_post!.thumbnailUrl, height: isMobileSize ? 200 : 350, width: MediaQuery.of(context).size.width, fit: BoxFit.fitWidth),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: isMobileSize ? 20 : 10),
                        constraints: const BoxConstraints(maxWidth: 1000),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 30),
                              Text(_post!.category,
                                  style: TextStyle(
                                      fontFamily: FontFamily.sourceSansPro.fontFamily, fontSize: isMobileSize ? 16 : 18, fontWeight: FontWeight.w600, color: ChandroidColors.primaryColor.color)),
                              const SizedBox(height: 15),
                              Text(_post!.title,
                                  style: TextStyle(
                                      fontFamily: FontFamily.appleSDGothicNeo.fontFamily, fontSize: isMobileSize ? 22 : 30, fontWeight: FontWeight.w700, color: ChandroidColors.textColor.color)),
                              const SizedBox(height: 5),
                              Text(_post!.subtitle,
                                  style: TextStyle(
                                      fontFamily: FontFamily.appleSDGothicNeo.fontFamily, fontSize: isMobileSize ? 14 : 17, fontWeight: FontWeight.w500, color: ChandroidColors.textColor.color)),
                              const SizedBox(height: 10),
                              Text(DateFormat('yyyy-MM-dd hh:mm').format(_post!.date),
                                  style: TextStyle(
                                      fontFamily: FontFamily.appleSDGothicNeo.fontFamily,
                                      fontSize: isMobileSize ? 14 : 15,
                                      fontWeight: FontWeight.normal,
                                      color: const Color.fromARGB(255, 144, 148, 154))),
                              SizedBox(height: isMobileSize ? 100 : 70),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 100),
                      const Footer()
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      );
    } else {
      return BasePage(title: '', body: Container(), tab: MainTab.blog);
    }
  }
}
