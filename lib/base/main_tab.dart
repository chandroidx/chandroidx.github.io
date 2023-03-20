import 'package:chandroidx/home/home_page.dart';
import 'package:chandroidx/main.dart';
import 'package:chandroidx/portfolio/portfolio_page.dart';
import 'package:chandroidx/utils/colors.dart';
import 'package:chandroidx/utils/fonts.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MainTabContainer extends StatefulWidget {
  final MainTab tab;

  const MainTabContainer({super.key, required this.tab});

  @override
  State<StatefulWidget> createState() => MainTabContainerState();
}

class MainTabContainerState extends State<MainTabContainer> {
  _launchBlog() async {
    final uri = Uri.parse('https://blog.chandroidx.com');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch https://blog.chandroidx.com';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Row(
        children: [
          MainTabButton(
            title: MainTab.home.title,
            isSelected: widget.tab == MainTab.home,
            onPressed: () => MainTab.home.navigate(context),
          ),
          const SizedBox(width: 30),
          MainTabButton(
            title: MainTab.portfolio.title,
            isSelected: widget.tab == MainTab.portfolio,
            onPressed: () => MainTab.portfolio.navigate(context),
          ),
          const SizedBox(width: 30),
          MainTabButton(
            title: 'Blog',
            isSelected: false,
            onPressed: () => _launchBlog(),
          ),
        ],
      ),
    );
  }
}

class MainTabButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function onPressed;

  const MainTabButton({super.key, required this.title, required this.isSelected, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        padding: const EdgeInsets.all(0),
        minWidth: 0,
        onPressed: () => onPressed(),
        hoverColor: Colors.transparent,
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 15.toDouble(),
                fontFamily: FontFamily.sourceSansPro.fontFamily,
                color: ChandroidColors.textColor.color,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Visibility(
                visible: isSelected,
                child: Container(
                  width: 40,
                  height: 1.5,
                  color: ChandroidColors.textColor.color,
                ))
          ],
        ));
  }
}

enum MainTab {
  home,
  portfolio;

  static Map<String, Widget Function(BuildContext)> routes() {
    Map<String, Widget Function(BuildContext)> routes = {};

    for (var element in MainTab.values) {
      routes[element.route] = (context) => element.navigationRoute;
    }

    return routes;
  }
}

extension MainTabExtension on MainTab {
  String get title {
    switch (this) {
      case MainTab.home:
        return 'Home';
      case MainTab.portfolio:
        return 'Portfolio';
    }
  }

  String get route {
    switch (this) {
      case MainTab.home:
        return '/';
      case MainTab.portfolio:
        return '/portfolio';
    }
  }

  Widget get navigationRoute {
    switch (this) {
      case MainTab.home:
        return const HomePage();
      case MainTab.portfolio:
        return const PortfolioPage();
    }
  }

  void navigate(BuildContext context, {String? id}) {
    router.navigateTo(context, route, transition: TransitionType.none);
  }
}
