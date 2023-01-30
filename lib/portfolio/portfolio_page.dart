import 'package:chandroidx/base/base_page.dart';
import 'package:chandroidx/base/main_tab.dart';
import 'package:chandroidx/portfolio/portfolio.dart';
import 'package:chandroidx/utils/api_utils.dart';
import 'package:flutter/material.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<StatefulWidget> createState() => PortfolioPageState();
}

class PortfolioPageState extends State<PortfolioPage> {
  List<Portfolio> _portfolios = [];

  @override
  void initState() {
    APIUtils.getPortfolios().then((value) => {
          setState(() {
            _portfolios = value;
          })
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    for (var element in _portfolios) {
      precacheImage(NetworkImage(element.thumbnailUrl), context);
    }

    return BasePage(
        title: '찬드로이드 ☘ | 포트폴리오',
        body: ListView.separated(
          separatorBuilder: (_, __) => const Divider(height: 100, thickness: 1),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _portfolios.length,
          itemBuilder: (BuildContext context, int index) {
            return PortfolioWidget(
              portfolio: _portfolios[index],
            );
          },
        ),
        tab: MainTab.portfolio);
  }
}
