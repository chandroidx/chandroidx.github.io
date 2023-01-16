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
      child:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: Column(
                    children: [
                      MainTabContainer(tab: tab),
                      Container(
                        child: body,
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ) ,
    );
  }
}
