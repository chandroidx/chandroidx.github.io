import 'package:chandroidx/base/base_page.dart';
import 'package:chandroidx/base/main_tab.dart';
import 'package:chandroidx/portfolio/portfolio.dart';
import 'package:flutter/material.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    for (var element in Portfolio.portfolios) {
      precacheImage(AssetImage(element.asset), context);
    }

    return BasePage(
        title: '찬드로이드 ☘ | 포트폴리오',
        body: ListView.separated(
          separatorBuilder: (_, __) => const Divider(height: 100, thickness: 1),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: Portfolio.portfolios.length,
          itemBuilder: (BuildContext context, int index) {
            return PortfolioWidget(
              portfolio: Portfolio.portfolios[index],
            );
          },
        ),
        tab: MainTab.portfolio);
  }
}
