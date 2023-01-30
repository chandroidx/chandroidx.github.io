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
        Image.network(portfolio.thumbnailUrl, height: 350),
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
              Text('${DateFormat('yyyy.MM').format(portfolio.startDate)} - ${portfolio.endDate != null ? DateFormat('yyyy.MM').format(portfolio.endDate!) : ''}',
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
  final DateTime? endDate;
  final DateTime startDate;
  final String thumbnailUrl;
  final List<PortfolioSkill> skills;

  Portfolio(this.category, this.title, this.contents, this.description, this.endDate, this.startDate, this.thumbnailUrl, this.skills);

  factory Portfolio.fromJson(dynamic json) {
    return Portfolio(
      json['category'],
      json['title'],
      (json['contents'] as List<dynamic>).map((e) => e.toString()).toList(),
      json['description'],
      json['end_date'] != null ? DateTime.parse(json['end_date']) : null,
      DateTime.parse(json['start_date']),
      json['thumbnail_url'],
      (json['skills'] as List<dynamic>).map((e) => PortfolioSkill.fromJson(e)).toList(),
    );
  }
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

class PortfolioSkill {
  final String name;
  final bool highlight;

  PortfolioSkill({required this.name, required this.highlight});

  factory PortfolioSkill.fromJson(dynamic json) {
    return PortfolioSkill(name: json['name'], highlight: json['highlight']);
  }
}
