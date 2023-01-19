import 'package:chandroidx/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../home/profile_link_button.dart';

class Footer extends StatelessWidget {
  final footerColor = const Color.fromARGB(255, 140, 152, 169);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraint) {
      return Container(
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
                        color: footerColor,
                        fontWeight: FontWeight.w600,
                        fontFamily: FontFamily.sourceSansPro.fontFamily,
                      )),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () => {launchUrl(Uri.parse('mailto:pycivan@gmail.com'))},
                    child: Text(
                      "pycivan@gmail.com",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontFamily: FontFamily.sourceSansPro.fontFamily,
                        fontSize: 15,
                        decoration: TextDecoration.none,
                        color: footerColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ProfileLinkButton(assetName: 'assets/ico_github.svg', url: 'https://github.com/chandroidx', color: footerColor),
                          const SizedBox(width: 20),
                          const ProfileLinkButton(assetName: 'assets/ico_instagram.svg', url: 'https://instagram.com/ch_android', color: null),
                        ],
                      ),
                      Text(
                        "©chandroidx. 2023 (Thanks to @cowkite)",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontFamily: FontFamily.sourceSansPro.fontFamily,
                          fontSize: 13,
                          decoration: TextDecoration.none,
                          color: footerColor,
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
