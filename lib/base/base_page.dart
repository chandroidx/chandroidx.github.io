import 'package:chandroidx/base/footer/footer.dart';
import 'package:chandroidx/base/main_tab.dart';
import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  final String title;
  final Widget body;
  final MainTab tab;

  const BasePage({super.key, required this.title, required this.body, required this.tab});

  @override
  Widget build(BuildContext context) {
    return Title(
      color: Colors.black,
      title: title,
      child: Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      constraints: const BoxConstraints(maxWidth: 1000),
                      child: Column(
                        children: [MainTabContainer(tab: tab), Padding(padding: const EdgeInsets.fromLTRB(0, 60, 0, 0), child: body)],
                      ),
                    ),
                    const SizedBox(height: 100),
                    const Footer()
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
