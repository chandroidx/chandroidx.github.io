import 'package:chandroidx/base/base_page.dart';
import 'package:chandroidx/base/main_tab.dart';
import 'package:chandroidx/home/skill.dart';
import 'package:chandroidx/home/sub_title.dart';
import 'package:chandroidx/utils/colors.dart';
import 'package:chandroidx/utils/fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Skill> _skills = [];

  _requestSkills() async {
    var collection = await FirebaseFirestore.instance.collection('skills').get();

    setState(() {
      _skills = collection.docs.map((e) => Skill.fromResponse(e)).toList();
      _skills.sort((a, b) => b.highlight ? 1 : -1);
    });
  }

  @override
  void initState() {
    _requestSkills();
    super.initState();
  }

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
              const SizedBox(height: 5),
              Text(
                '박예찬',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  decoration: TextDecoration.none,
                  color: ChandroidColors.textColor.color,
                ),
              ),
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
              const SizedBox(height: 80),
              SubTitle(title: 'Activities', emoji: '👨‍💻', children: [
                Image.network('https://ghchart.rshah.org/chandroidx'),
                const SizedBox(height: 10),
                Image.network(width: 500, 'https://wakatime.com/share/@ChandroidX/a8bdfb2d-3f53-4b74-bf8b-5a8f91960549.png')
              ]),
              const SizedBox(height: 80),
              SubTitle(title: 'Skills', emoji: '💪', children: [
                Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.start,
                  spacing: 10,
                  runSpacing: 10,
                  children: _skills.map((skill) => SkillChip(skill: skill)).toList(),
                )
              ])
            ],
          ),
        ),
        tab: MainTab.home);
  }
}
