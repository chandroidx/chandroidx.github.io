import 'package:chandroidx/utils/colors.dart';
import 'package:chandroidx/utils/fonts.dart';
import 'package:flutter/material.dart';

class PortfolioWidget extends StatelessWidget {
  final Portfolio portfolio;

  const PortfolioWidget({super.key, required this.portfolio});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(portfolio.asset, height: 350),
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(portfolio.category, style: TextStyle(fontFamily: FontFamily.sourceSansPro.fontFamily, fontSize: 17, fontWeight: FontWeight.w600, color: ChandroidColors.primaryColor.color)),
              const SizedBox(height: 20),
              Text(portfolio.title, style: TextStyle(fontFamily: FontFamily.appleSDGothicNeo.fontFamily, fontSize: 22, fontWeight: FontWeight.w700, color: ChandroidColors.textColor.color)),
              const SizedBox(height: 10),
              Text(portfolio.description, style: TextStyle(fontFamily: FontFamily.appleSDGothicNeo.fontFamily, fontSize: 16, fontWeight: FontWeight.normal, color: ChandroidColors.textColor.color)),
              const SizedBox(height: 10),
              Text(portfolio.dateRange,
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
  final String asset;
  final String category;
  final String title;
  final String description;
  final String dateRange;
  final List<String> contents;

  final List<PortfolioSkill> skills;

  Portfolio({required this.asset, required this.category, required this.title, required this.description, required this.dateRange, required this.contents, required this.skills});

  static final portfolios = [
    Portfolio(
      asset: 'assets/portfolio/thumbnail_aron.png',
      category: 'Mobile application / Smart glass application',
      title: 'ARON (PL)',
      description: '영상회의 및 업무관리 서비스',
      dateRange: '2021.03 - 2023.01',
      contents: ['영상회의 PIP 모드 구현', '가상 배경, 얼굴 모자이크 / 블러, Object Detection 기능 개발', 'MediaProjection - 화면 공유 기능 개발', 'Flask - Rest API 개발', 'MVVM + Clean Architecture 적용'],
      skills: [
        PortfolioSkill(name: 'Android', isLibrary: false),
        PortfolioSkill(name: 'Kotlin', isLibrary: false),
        PortfolioSkill(name: 'Pycharm', isLibrary: false),
        PortfolioSkill(name: 'PostgreSQL', isLibrary: false),
        PortfolioSkill(name: 'Flask', isLibrary: true),
        PortfolioSkill(name: 'WebRTC', isLibrary: true),
        PortfolioSkill(name: 'Socket.IO', isLibrary: true),
        PortfolioSkill(name: 'Firebase', isLibrary: true),
        PortfolioSkill(name: 'Google Play', isLibrary: true),
        PortfolioSkill(name: 'MLKit', isLibrary: true),
      ],
    ),
    Portfolio(
      asset: 'assets/portfolio/thumbnail_lg_manual.png',
      category: 'Smart glass application',
      title: 'LG Electronics E-manual Smart Creator (PL)',
      description: '매뉴얼 제작 서비스',
      dateRange: '2022.09 - 2022.11',
      contents: ['영상회의 PIP 모드 구현', '가상 배경, 얼굴 모자이크 / 블러, Object Detection 기능 개발', 'MediaProjection - 화면 공유 기능 개발', 'Flask - Rest API 개발', 'MVVM + Clean Architecture 적용'],
      skills: [
        PortfolioSkill(name: 'Android', isLibrary: false),
        PortfolioSkill(name: 'Kotlin', isLibrary: false),
        PortfolioSkill(name: 'Room', isLibrary: true),
        PortfolioSkill(name: 'POI', isLibrary: true),
        PortfolioSkill(name: 'Retrofit2', isLibrary: true),
      ],
    ),
    Portfolio(
      asset: 'assets/portfolio/thumbnail_fieldmaster_viewer.png',
      category: 'Mobile application / Smart glass application',
      title: 'Yokogawa FieldMasterViewer (PL)',
      description: '영상회의 및 업무관리 서비스',
      dateRange: '2022.02 - 2022.10',
      contents: ['FCM push 연동', 'Google Play 앱 배포 및 유지 보수', 'MVVM + Clean Architecture 적용'],
      skills: [
        PortfolioSkill(name: 'Android', isLibrary: false),
        PortfolioSkill(name: 'Kotlin', isLibrary: false),
        PortfolioSkill(name: 'WebRTC', isLibrary: true),
        PortfolioSkill(name: 'Socket.IO', isLibrary: true),
        PortfolioSkill(name: 'Realm', isLibrary: true),
        PortfolioSkill(name: 'Firebase', isLibrary: true),
        PortfolioSkill(name: 'Google Play', isLibrary: true),
      ],
    ),
    Portfolio(
      asset: 'assets/portfolio/thumbnail_gg_erection.png',
      category: 'Mobile application',
      title: '경기도 ICT 기반 건설현장 안전 관리 시스템 (PL)',
      description: '안전 관리 시스템',
      dateRange: '2021.09 - 2021.12',
      contents: ['Hybrid 웹뷰 연동'],
      skills: [
        PortfolioSkill(name: 'Android', isLibrary: false),
        PortfolioSkill(name: 'Kotlin', isLibrary: false),
        PortfolioSkill(name: 'WebRTC', isLibrary: true),
        PortfolioSkill(name: 'Socket.IO', isLibrary: true),
      ],
    ),
    Portfolio(
      asset: 'assets/portfolio/thumbnail_gg.png',
      category: 'Smart glass application',
      title: '경기도 IoT 기반 스마트글라스 활용 원격 안전 점검 시스템',
      description: '영상회의 및 업무관리 서비스',
      dateRange: '2020.09 - 2020.12',
      contents: ['WebRTC + Socket.IO를 이용한 영상회의 기능 구현', 'Accelerometer 센서 -> 기기의 기울임을 이용한 스크롤 기능 구현', '이미지 확대 및 미니맵 표시 라이브러리 개발'],
      skills: [
        PortfolioSkill(name: 'Android', isLibrary: false),
        PortfolioSkill(name: 'Kotlin', isLibrary: false),
        PortfolioSkill(name: 'WebRTC', isLibrary: true),
        PortfolioSkill(name: 'Socket.IO', isLibrary: true),
        PortfolioSkill(name: 'Retrofit2', isLibrary: true),
        PortfolioSkill(name: 'ExoPlayer', isLibrary: true),
      ],
    )
  ];
}

class PortfolioSkillWidget extends StatelessWidget {
  final PortfolioSkill skill;

  const PortfolioSkillWidget({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 3, 15, 3),
      decoration: BoxDecoration(
        border: Border.all(color: skill.isLibrary ? ChandroidColors.primaryColor.color : ChandroidColors.secondaryColor.color),
        borderRadius: BorderRadius.circular(1000),
      ),
      child: Text(
        skill.name,
        style: TextStyle(
          fontFamily: FontFamily.sourceSansPro.fontFamily,
          fontSize: 13,
          color: skill.isLibrary ? ChandroidColors.primaryColor.color : ChandroidColors.secondaryColor.color,
        ),
      ),
    );
  }
}

class PortfolioSkill {
  final String name;
  final bool isLibrary;

  PortfolioSkill({required this.name, required this.isLibrary});
}
