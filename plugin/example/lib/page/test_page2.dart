import 'package:flutter/material.dart';

import 'package:talkingdata_sdk_plugin/talkingdata_sdk_plugin.dart';

class TestPage2 extends StatefulWidget{

  @override
  State createState(){
    return TestPageState2();
  }



}

class TestPageState2 extends State<TestPage2>{
  String deviceID;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    _setDeviceID();
    return Scaffold(
      appBar: AppBar(
        title: Text('测试页面2'),
      ),
      body: Center(
        child: Text('testPage2'),
      ),
    );
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
  }

  @override
  void dispose(){
    super.dispose();
  }

  _setDeviceID() async{
    deviceID =  await TalkingDataSDK.getDeviceID();
    //Print deviceID or dosomething
    print(deviceID);
  }
}

