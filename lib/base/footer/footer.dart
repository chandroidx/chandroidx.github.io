import 'dart:convert';

import 'package:chandroidx/base/footer/profile_link.dart';
import 'package:chandroidx/utils/clickable.dart';
import 'package:chandroidx/utils/colors.dart';
import 'package:chandroidx/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<StatefulWidget> createState() => FooterState();
}

class FooterState extends State<Footer> {
  List<ProfileLink> _links = [];

  void _getProfileLinks() async {
    var uri = Uri.https('api.chandroidx.com:5020', 'profile/get-links');
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      setState(() {
        final List<dynamic> responseLinks = jsonDecode(response.body);
        _links = responseLinks.map((e) => ProfileLink.fromJson(e)).toList();
      });
    }
  }

  @override
  void initState() {
    _getProfileLinks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraint) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          width: constraint.maxWidth,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 247, 249, 252),
            border: Border(
              top: BorderSide(
                width: 1.0,
                color: Color.fromARGB(255, 218, 224, 230),
              ),
              bottom: BorderSide(
                width: 1.0,
                color: Color.fromARGB(255, 218, 224, 230),
              ),
            ),
          ),
          child: SizedBox(
            width: 1000,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('찬드로이드 개발 블로그 \u2618',
                      style: TextStyle(
                        fontSize: 17,
                        color: ChandroidColors.footerColor.color,
                        fontWeight: FontWeight.w600,
                        fontFamily: FontFamily.sourceSansPro.fontFamily,
                      )),
                  const SizedBox(height: 5),
                  Clickable(
                    onClick: () => {launchUrl(Uri.parse('mailto:pycivan@gmail.com'))},
                    child: Text(
                      "pycivan@gmail.com",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontFamily: FontFamily.sourceSansPro.fontFamily,
                        fontSize: 15,
                        decoration: TextDecoration.none,
                        color: ChandroidColors.footerColor.color,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    runSpacing: 10,
                    children: [
                      Wrap(
                        direction: Axis.horizontal,
                        spacing: 20,
                        children: _links
                            .map(
                              (link) => ProfileLinkButton(
                                profileLink: link,
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(width: 700),
                      Text(
                        "©chandroidx. 2023 (Thanks to @cowkite)",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontFamily: FontFamily.sourceSansPro.fontFamily,
                          fontSize: 13,
                          decoration: TextDecoration.none,
                          color: ChandroidColors.footerColor.color,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ));
    });
  }
}
