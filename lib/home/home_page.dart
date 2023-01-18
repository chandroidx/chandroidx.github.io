import 'package:chandroidx/base/base_page.dart';
import 'package:chandroidx/base/main_tab.dart';
import 'package:chandroidx/home/profile_link_button.dart';
import 'package:flutter/material.dart';

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
              const Text(
                "pycivan@gmail.com",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontFamily: 'NotoSans',
                  fontSize: 15,
                  decoration: TextDecoration.none,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  ProfileLinkButton(assetName: 'assets/ico_github.svg', url: 'https://github.com/chandroidx'),
                ],
              )
            ],
          ),
        ),
        tab: MainTab.home);
  }
}
