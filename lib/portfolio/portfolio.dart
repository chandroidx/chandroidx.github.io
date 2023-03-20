import 'package:chandroidx/utils/colors.dart';
import 'package:chandroidx/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PortfolioWidget extends StatelessWidget {
  final Portfolio portfolio;

  const PortfolioWidget({super.key, required this.portfolio});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        portfolio.thumbnail,
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(portfolio.category, style: TextStyle(fontFamily: FontFamily.sourceSansPro.fontFamily, fontSize: 17, fontWeight: FontWeight.w600, color: ChandroidColors.primaryColor.color)),
              const SizedBox(height: 15),
              Text(portfolio.title, style: TextStyle(fontFamily: FontFamily.appleSDGothicNeo.fontFamily, fontSize: 22, fontWeight: FontWeight.w700, color: ChandroidColors.textColor.color)),
              const SizedBox(height: 8),
              Text(portfolio.description, style: TextStyle(fontFamily: FontFamily.appleSDGothicNeo.fontFamily, fontSize: 16, fontWeight: FontWeight.normal, color: ChandroidColors.textColor.color)),
              const SizedBox(height: 8),
              Text('${portfolio.startDate} - ${portfolio.endDate}',
                  style: TextStyle(fontFamily: FontFamily.appleSDGothicNeo.fontFamily, fontSize: 16, fontWeight: FontWeight.normal, color: const Color.fromARGB(255, 144, 148, 154))),
              const SizedBox(height: 20),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: portfolio.contents
                      .map((content) =>
                          Text('- $content', style: TextStyle(fontFamily: FontFamily.appleSDGothicNeo.fontFamily, fontSize: 15, fontWeight: FontWeight.normal, color: ChandroidColors.textColor.color)))
                      .toList()),
              const SizedBox(height: 30),
              Wrap(
                direction: Axis.horizontal,
                spacing: 7,
                runSpacing: 7,
                children: portfolio.skills.map((skill) => PortfolioSkillWidget(skill: skill)).toList(),
              )
            ],
          ),
        )
      ],
    );
  }
}

class Portfolio {
  final String category;
  final String title;
  final List<String> contents;
  final String description;
  final String endDate;
  final String startDate;
  final Image thumbnail;
  final List<PortfolioSkill> skills;

  Portfolio(this.category, this.title, this.contents, this.description, this.endDate, this.startDate, this.thumbnail, this.skills);
}

class PortfolioSkillWidget extends StatelessWidget {
  final PortfolioSkill skill;

  const PortfolioSkillWidget({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 3, 15, 3),
      decoration: BoxDecoration(
        border: Border.all(color: skill.highlight ? ChandroidColors.secondaryColor.color : ChandroidColors.primaryColor.color),
        borderRadius: BorderRadius.circular(1000),
      ),
      child: Text(
        skill.name,
        style: TextStyle(
          fontFamily: FontFamily.sourceSansPro.fontFamily,
          fontSize: 13,
          color: skill.highlight ? ChandroidColors.secondaryColor.color : ChandroidColors.primaryColor.color,
        ),
      ),
    );
  }
}

final portfolios = [
  Portfolio(
    'Smart glass application',
    '경기도 IoT 기반 스마트글라스 활용 원격 안전 점검 시스템',
    ['WebRTC + Socket.IO를 이용한 영상회의 기능 구현', 'Accelerometer 센서 -> 기기의 기울임을 이용한 스크롤 기능 구현', '이미지 확대 및 미니맵 표시 라이브러리 개발'],
    '영상회의 및 업무관리 서비스',
    '2020.12',
    '2020.09',
    Image.asset('assets/portfolio/thumbnail_gg.png', height: 350),
    [
      PortfolioSkill(name: 'Android', highlight: true),
      PortfolioSkill(name: 'Kotlin', highlight: true),
      PortfolioSkill(name: 'WebRTC', highlight: false),
      PortfolioSkill(name: 'Socket.IO', highlight: false),
      PortfolioSkill(name: 'Retrofit2', highlight: false),
      PortfolioSkill(name: 'ExoPlayer', highlight: false),
    ],
  ),
  Portfolio(
    'Mobile application',
    '경기도 ICT 기반 건설현장 안전 관리 시스템 (PL)',
    ['Hybrid 웹뷰 연동'],
    '안전 관리 시스템',
    '2021.12',
    '2021.09',
    Image.asset('assets/portfolio/thumbnail_gg_erection.png', height: 350),
    [
      PortfolioSkill(name: 'Android', highlight: true),
      PortfolioSkill(name: 'Kotlin', highlight: true),
      PortfolioSkill(name: 'WebRTC', highlight: false),
      PortfolioSkill(name: 'Socket.IO', highlight: false),
    ],
  ),
  Portfolio(
    'Mobile application / Smart glass application',
    'Yokogawa FieldMasterViewer (PL)',
    [
      'FCM push 연동',
      'Google Play 앱 배포 및 유지 보수',
      'MVVM + Clean Architecture 적용',
    ],
    '영상회의 및 업무관리 서비스',
    '2022.10',
    '2022.02',
    Image.asset('assets/portfolio/thumbnail_fieldmaster_viewer.png', height: 350),
    [
      PortfolioSkill(name: 'Android', highlight: true),
      PortfolioSkill(name: 'Kotlin', highlight: true),
      PortfolioSkill(name: 'WebRTC', highlight: false),
      PortfolioSkill(name: 'Socket.IO', highlight: false),
      PortfolioSkill(name: 'Firebase', highlight: false),
      PortfolioSkill(name: 'Google Play', highlight: false),
      PortfolioSkill(name: 'Realm', highlight: false),
    ],
  ),
  Portfolio(
    'Smart glass application',
    'LG Electronics E-manual Smart Creator (PL)',
    [
      'Room Database 구조 설계',
      'POI 라이브러리를 활용한 엑셀 컨버팅',
    ],
    '매뉴얼 제작 서비스',
    '2022.11',
    '2022.09',
    Image.asset('assets/portfolio/thumbnail_lg_manual.png', height: 350),
    [
      PortfolioSkill(name: 'Android', highlight: true),
      PortfolioSkill(name: 'Kotlin', highlight: true),
      PortfolioSkill(name: 'Room', highlight: false),
      PortfolioSkill(name: 'POI', highlight: false),
      PortfolioSkill(name: 'Retrofit2', highlight: false),
    ],
  ),
  Portfolio(
    'Mobile application / Smart glass application',
    'ARON (PL)',
    [
      '영상회의 PIP 모드 구현',
      '가상 배경, 얼굴 모자이크 / 블러, Object Detection 기능 개발',
      '화면 공유 기능 개발 (Media Projection)',
      'Rest API 개발 (Flask)',
      'MVVM + Clean Architecture 구조 설계',
    ],
    '영상회의 및 업무관리 서비스',
    '2022.11',
    '2021.03',
    Image.asset('assets/portfolio/thumbnail_aron.png', height: 350),
    [
      PortfolioSkill(name: 'Android', highlight: true),
      PortfolioSkill(name: 'Kotlin', highlight: true),
      PortfolioSkill(name: 'PyCharm', highlight: true),
      PortfolioSkill(name: 'PostgreSQL', highlight: true),
      PortfolioSkill(name: 'Flask', highlight: false),
      PortfolioSkill(name: 'WebRTC', highlight: false),
      PortfolioSkill(name: 'Socket.IO', highlight: false),
      PortfolioSkill(name: 'Firebase', highlight: false),
      PortfolioSkill(name: 'Google Play', highlight: false),
      PortfolioSkill(name: 'MLKit', highlight: false),
    ],
  ),
];

class PortfolioSkill {
  final String name;
  final bool highlight;

  PortfolioSkill({required this.name, required this.highlight});

  factory PortfolioSkill.fromJson(dynamic json) {
    return PortfolioSkill(name: json['name'], highlight: json['highlight']);
  }
}
