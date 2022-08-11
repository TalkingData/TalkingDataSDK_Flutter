import 'package:flutter/material.dart';

class PageStatisticsPage extends StatelessWidget{
  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    // TODO: implement build
    return Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        constraints: const BoxConstraints.expand(),
        child: ListView(
          children: const <Widget>[
            Text(
                '页面统计用于帮助开发者追踪用户对页面的访问情况：\n',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text('1.在不同页面的访问量\n'
                '2.每个页面的停留时长\n'
                '3.页面间跳转情况\n'
            ),
            Text('对每个需要追踪的页面都需要开发者分别进行方法调用'),
            Text('此Demo默认统计了在各个页面的访问。'),
          ],
        ),
    );
  }
}



