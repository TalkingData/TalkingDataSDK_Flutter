import 'package:flutter/material.dart';


class BaseStatisticsPage extends StatelessWidget{
  BuildContext context;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    this.context = context;
    return Container(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      constraints: BoxConstraints.expand(
      ),
      child: ListView(
        children: <Widget>[
          Text(
              '集成SDK并进行基础配置后则可以统计应用的基本情况，App Analytics提供以下基础统计：\n',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
          Text('1、应用启动时间、启动次数、每次使用持续时长\n'
              '2、新增设备、活跃设备、设备留存、流失及回流\n'
              '3、设备的机型分布\n'
              '4、设备的地理位置分布\n'
              '5、设备的运营商及网络分布\n'
              '6、iOS设备是否越狱、是否安装破解应用\n'
              '7、应用异常分析（默认为关闭状态，集成SDK时请按需开启）\n'),
          Text(
              '其中以下几点需要注意：\n',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold
            ),
          ),
          Text('1、保证App ID正常。我们是通过App ID来区分不同应用的数据，所以请务必保证App ID正常。\n'
              '2、保证渠道ID正常。在分包推广时如果需要区分不同渠道带来的用户规模及运营效果，需要给每个渠道或活动一个独立的渠道ID。\n'),
          Container(
            width: double.infinity,
              child: Card(
                child: Column(
                  children: <Widget>[
                    Text('产生同步异常'),
                    RaisedButton(
                      child: Text(
                          'Exception',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                      onPressed: _exception,
                      color: Colors.blueAccent,
                    ),
                  ],
                )
              )
          ),
          Container(
              width: double.infinity,
              child: Card(
                  child: Column(
                    children: <Widget>[
                      Text('产生异步异常'),
                      RaisedButton(
                        child: Text(
                            'Async Error',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                        onPressed: _onError,
                        color: Colors.blueAccent,
                      ),
                    ],
                  )
              )
          ),
          Container(
              width: double.infinity,
              child: Card(
                  child: Column(
                    children: <Widget>[
                      Text('测试账户功能'),
                      RaisedButton(
                        child: Text(
                          'Profile',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                        onPressed: _profile,
                        color: Colors.blueAccent,
                      ),
                    ],
                  )
              )
          ),
        ],
      ),
    );
  }

  void _exception(){
    throw Exception('an error occured!!!!!');
  }

  void _onError(){
    Future.delayed(Duration(seconds: 1)).then((e) => throw Exception('async error occured!!!'));
  }

  void _profile(){
    Navigator.of(context).pushNamed('/profile');
  }
}

