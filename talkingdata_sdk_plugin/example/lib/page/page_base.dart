import 'package:flutter/material.dart';
import '../page_config.dart';
class BasePage extends StatelessWidget{
  final Widget? body;

  const BasePage({
    this.body
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    String title = arguments['title'];
    String pageName = arguments['pageName'];
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: PageSelector.getPageContent(pageName),
    );
  }
}