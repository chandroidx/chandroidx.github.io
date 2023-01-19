import 'dart:html';

import 'package:chandroidx/base/base_page.dart';
import 'package:chandroidx/base/main_tab.dart';
import 'package:chandroidx/home/profile_link_button.dart';
import 'package:chandroidx/home/sub_title.dart';
import 'package:chandroidx/utils/colors.dart';
import 'package:chandroidx/utils/fonts.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
        title: '찬드로이드 개발 블로그 \u2618️',
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '@chandroidX',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                  fontFamily: FontFamily.appleSDGothicNeo.fontFamily,
                  color: ChandroidColors.primaryColor.color,
                ),
              ),
              Text(
                '박예찬',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  decoration: TextDecoration.none,
                  color: ChandroidColors.textColor.color,
                ),
              ),
              // GestureDetector(
              //   onTap: () => {launchUrl(Uri.parse('mailto:pycivan@gmail.com'))},
              //   child: const Text(
              //     "pycivan@gmail.com",
              //     style: TextStyle(
              //       fontWeight: FontWeight.normal,
              //       fontFamily: 'NotoSans',
              //       fontSize: 15,
              //       decoration: TextDecoration.none,
              //       color: Colors.black54,
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 5,
              ),
              Text('성장하는 안드로이드 개발자 \u2618️',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    decoration: TextDecoration.none,
                    color: ChandroidColors.textColor.color,
                  )),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  ProfileLinkButton(assetName: 'assets/ico_github.svg', url: 'https://github.com/chandroidx'),
                  SizedBox(width: 5),
                  ProfileLinkButton(assetName: 'assets/ico_instagram.svg', url: 'https://instagram.com/ch_android'),
                ],
              ),
              const SizedBox(height: 80),
              SubTitle(emoji: '👨‍💻', title: 'Activities', children: [
                Image.network('https://ghchart.rshah.org/chandroidx'),
                const SizedBox(height: 10),
                Image.network(width: 500, 'https://wakatime.com/share/@ChandroidX/a8bdfb2d-3f53-4b74-bf8b-5a8f91960549.png')
              ]),
            ],
          ),
        ),
        tab: MainTab.home);
  }
}
