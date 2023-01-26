import 'package:chandroidx/base/footer/profile_link.dart';
import 'package:chandroidx/utils/colors.dart';
import 'package:chandroidx/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

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
                  GestureDetector(
                    onTap: () => {launchUrl(Uri.parse('mailto:pycivan@gmail.com'))},
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
                        children: ProfileLink.links
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
