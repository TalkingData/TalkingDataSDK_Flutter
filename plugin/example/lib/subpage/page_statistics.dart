import 'package:flutter/material.dart';

class PageStatisticsPage extends StatelessWidget{
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    // TODO: implement build
    return Container(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
        constraints: BoxConstraints.expand(),
        child: ListView(
          children: <Widget>[
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
            Card(
              child: Column(
                children: <Widget>[
                  Text('以下按钮用于测试用户跳转至后续页面：'),
                  RaisedButton(
                    child: Text(
                        '跳转至页面1',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    onPressed: _goToPage1,
                    color: Colors.blueAccent,
                  ),
                  RaisedButton(
                    child: Text(
                      '跳转至页面2',
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    onPressed: _goToPage2,
                    color: Colors.blueAccent,
                  )
                ],
              ),
            )
          ],
        ),
    );
  }

  void _goToPage1(){
    Navigator.pushNamed(
        context,
        '/test_page1',
    );
  }

  void _goToPage2(){
    Navigator.pushNamed(
      context,
      '/test_page2',
    );
  }
}



