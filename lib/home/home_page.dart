import 'package:chandroidx/base/base_page.dart';
import 'package:chandroidx/base/main_tab.dart';
import 'package:chandroidx/home/profile_link_button.dart';
import 'package:chandroidx/home/sub_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
        title: '찬드로이드 개발 블로그 ☘',
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '박예찬',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  decoration: TextDecoration.none,
                  color: Colors.black87,
                ),
              ),
              GestureDetector(
                onTap: () => {launchUrl(Uri.parse('mailto:pycivan@gmail.com'))},
                child: const Text(
                  "pycivan@gmail.com",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: 'NotoSans',
                    fontSize: 15,
                    decoration: TextDecoration.none,
                    color: Colors.black54,
                  ),
                ),
              ),
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
              const SubTitle(emoji: '👨‍💻', title: 'Activities'),
              const SizedBox(height: 10),
              Image.network('https://ghchart.rshah.org/chandroidx'),
              const SizedBox(height: 10),
              Image.network(width: 500, 'https://wakatime.com/share/@ChandroidX/3b22ec11-9b50-4b7b-abdd-bd4616a44db9.png')
            ],
          ),
        ),
        tab: MainTab.home);
  }
}
