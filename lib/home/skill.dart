import 'package:chandroidx/utils/colors.dart';
import 'package:chandroidx/utils/fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SkillChip extends StatelessWidget {
  final Skill skill;

  const SkillChip({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      decoration: BoxDecoration(
        border: Border.all(color: skill.highlight ? ChandroidColors.secondaryColor.color : const Color.fromARGB(255, 216, 224, 231)),
        borderRadius: BorderRadius.circular(1000),
      ),
      child: Text(
        skill.name,
        style: TextStyle(
          fontFamily: FontFamily.sourceSansPro.fontFamily,
          fontSize: 15,
          color: skill.highlight ? ChandroidColors.secondaryColor.color : const Color.fromARGB(255, 51, 62, 76),
        ),
      ),
    );
  }
}

class Skill {
  final String name;
  final bool highlight;

  Skill({required this.name, required this.highlight});

  factory Skill.fromResponse(QueryDocumentSnapshot<Map<String, dynamic>> response) {
    return Skill(name: response['name'], highlight: response['highlight']);
  }
}
