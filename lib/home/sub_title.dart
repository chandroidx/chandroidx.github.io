import 'package:flutter/material.dart';

import '../utils/colors.dart';

class SubTitle extends StatelessWidget {
  final String emoji;
  final String title;
  final List<Widget> children;

  const SubTitle({super.key, required this.title, required this.emoji, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              emoji,
              style: const TextStyle(
                fontSize: 20,
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              title,
              style: TextStyle(
                color: androidColor,
                fontFamily: 'NotoSans',
                fontSize: 18,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        )
      ],
    );
  }
}
