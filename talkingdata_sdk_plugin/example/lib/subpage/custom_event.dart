import 'package:flutter/material.dart';
import 'package:talkingdata_sdk_plugin/talkingdata_sdk_plugin.dart';

class CustomEventPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CustomEventPageState();
  }

}

class _CustomEventPageState extends State<CustomEventPage>{
  final TextEditingController _controllerEventID = TextEditingController();
  final TextEditingController _controllerEventLabel = TextEditingController();
  final TextEditingController _controllerKey1 = TextEditingController();
  final TextEditingController _controllerValue1 = TextEditingController();
  final TextEditingController _controllerKey2 = TextEditingController();
  final TextEditingController _controllerValue2 = TextEditingController();
  final TextEditingController _controllerEventValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent
    );
    return Container(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      constraints: BoxConstraints.expand(),
      child: ListView(
        children: <Widget>[
          Text('自定义事件用于帮助开发者追踪所有希望追踪的用户与App的交互行为。'),
          Text('目前TalkingData提供了代码事件和灵动事件两种方式。'),
          Card(
              child: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    const Text('以下按钮仅限于代码事件测试：'),
                    TextField(
                      controller: _controllerEventID,
                      decoration: const InputDecoration(
                          hintText: '事件ID（必填）'
                      ),
                    ),
                    // TextField(
                    // controller: _controllerEventLabel,
                    //   decoration: InputDecoration(
                    //       hintText: '事件Label'
                    //   ),
                    // ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: const Text('事件参数（一个代码事件可同时支持50个不同参数）'),
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                decoration: const InputDecoration(
                                    hintText: 'key1'
                                ),
                              controller: _controllerKey1,
                              ),
                              flex: 1,
                            ),
                            Container(
                              width: 16,
                            ),
                            Expanded(
                              child: TextField(
                                decoration: const InputDecoration(
                                    hintText: 'value1'
                                ),
                              controller: _controllerValue1,
                              ),
                              flex: 1,
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'key2'
                                ),
                              controller: _controllerKey2,
                              ),
                              flex: 1,
                            ),
                            Container(
                              width: 16,
                            ),
                            Expanded(
                              child: TextField(
                                decoration: const InputDecoration(
                                    hintText: 'value2'
                                ),
                              controller: _controllerValue2,
                              ),
                              flex: 1,
                            ),
                          ],
                        )
                      ],
                    ),
                    ElevatedButton(
                      child: const Text(
                        '提交事件数据',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                      onPressed: _submitEventData,
                     style: buttonStyle,
                    )
                  ],
                ),
              )
          )
        ],
      ),
    );
  }

  void _submitEventData(){
    if(_controllerEventID.text.isEmpty){
      showDialog(
          context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
            return AlertDialog(
              title: const Text('错误：'),
              content: const Text('请填写事件ID ！'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
        }
      );
      return;
    }
    Map map = {};
    if(_controllerKey1.text.isNotEmpty){
      map[_controllerKey1.text] = _controllerValue1.text;
    }

    if(_controllerKey2.text.isNotEmpty){
      map[_controllerKey2.text] = _controllerValue2.text;
    }
    TalkingDataSDK.onEvent(
      eventId: _controllerEventID.text,
      params: map
    );
  }

}

