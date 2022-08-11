import 'package:flutter/material.dart';
import 'package:talkingdata_sdk_plugin/talkingdata_sdk_plugin.dart';
class ProfilePage extends StatefulWidget{

  @override
  State createState(){
    return ProfilePageState();
  }



}

class ProfilePageState extends State<ProfilePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('账户'),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          children: <Widget>[
            SizedBox(
                width: double.infinity,
                child: Card(
                    child: Column(
                      children: <Widget>[
                        const Text('注册'),
                        RaisedButton(
                          child: const Text(
                            'onRegister',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                          onPressed: _onRegister,
                          color: Colors.blueAccent,
                        ),
                      ],
                    )
                )
            ),
            SizedBox(
                width: double.infinity,
                child: Card(
                    child: Column(
                      children: <Widget>[
                        const Text('登录'),
                        RaisedButton(
                          child: const Text(
                            'onLogin',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                          onPressed: _onLogin,
                          color: Colors.blueAccent,
                        ),
                      ],
                    )
                )
            ),
            SizedBox(
                width: double.infinity,
                child: Card(
                    child: Column(
                      children: <Widget>[
                        const Text('更新账户信息'),
                        RaisedButton(
                          child: const Text(
                            'onProfileUpdate',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                          onPressed: _onProfileUpdate,
                          color: Colors.blueAccent,
                        ),
                      ],
                    )
                )
            ),
          ],
        ),
      ),
    );
  }

  void _onRegister(){
    TalkingDataProfile profile = TalkingDataProfile(
        name: "testName",
        type: TalkingDataProfileType.SINA_WEIBO,
        gender: TalkingDataGender.MALE,
        age: 18,
        property1: 'testValue1',
        property2: 'testValue2',
        property3: 'testValue3',
        property4: 'testValue4',
        property5: 'testValue5',
        property6: 0.01,
        property7: 5.8765,
        property8: 10,
        property9: 100000,
        property10: 1000000
    );
    TalkingDataSDK.onRegister(
      profileId: 'TestProfileId',
      profile: profile,
      invitationCode: '123'
    );
  }

  void _onLogin(){
    TalkingDataProfile profile = TalkingDataProfile(
        name: 'testName',
        type: TalkingDataProfileType.SINA_WEIBO,
        gender: TalkingDataGender.MALE,
        age: 18,
        property1: 'testValue1',
        property2: 'testValue2',
        property3: 'testValue3',
        property4: 'testValue4',
        property5: 'testValue5',
        property6: 0.01,
        property7: 5.8765,
        property8: 10,
        property9: 100000,
        property10: 1000000
    );
    TalkingDataSDK.onLogin(
      profileId: 'TestProfileId',
      profile: profile,
    );
  }

  void _onProfileUpdate(){
    TalkingDataProfile profile = TalkingDataProfile(
        name: 'testName',
        type: TalkingDataProfileType.SINA_WEIBO,
        gender: TalkingDataGender.MALE,
        age: 18,
        property1: 'testValue1',
        property2: 'testValue2',
        property3: 'testValue3',
        property4: 'testValue4',
        property5: 'testValue5',
        property6: 0.01,
        property7: 5.8765,
        property8: 10,
        property9: 100000,
        property10: 1000000
    );
    TalkingDataSDK.onProfileUpdate(profile);
  }
}

