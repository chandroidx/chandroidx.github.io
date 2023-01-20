import 'package:chandroidx/base/footer/profile_link_button.dart';
import 'package:chandroidx/utils/fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  final footerColor = const Color.fromARGB(255, 140, 152, 169);

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
                      FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                          future: FirebaseFirestore.instance.collection('profile_link').get(),
                          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                            if (snapshot.connectionState == ConnectionState.done) {
                              var docs = snapshot.data!.docs.map((e) => ProfileLink.fromResponse(e)).toList();
                              docs.sort((a, b) => a.id.compareTo(b.id));
                              return Row(
                                children: docs
                                    .map((doc) => Row(
                                          children: [
                                            ProfileLinkButton(
                                              svgUrl: doc.svgUrl,
                                              url: doc.url,
                                              color: doc.applyColor ? footerColor : null,
                                            ),
                                            const SizedBox(width: 20)
                                          ],
                                        ))
                                    .toList(),
                              );
                            } else {
                              return Container();
                            }
                          }),
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
