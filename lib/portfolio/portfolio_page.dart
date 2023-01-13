import 'package:chandroidx/base/base_page.dart';
import 'package:chandroidx/base/main_tab.dart';
import 'package:flutter/cupertino.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(title: '찬드로이드 ☘ | 포트폴리오', body: Container(), tab: MainTab.portfolio);
  }
}
