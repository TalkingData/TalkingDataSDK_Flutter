import 'package:flutter/material.dart';
import 'package:talkingdata_sdk_plugin/talkingdata_sdk_plugin.dart';

class InitPage extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _InitPageState();
  }

}

class _InitPageState extends State<InitPage>{
  late String initText;
  GlobalKey<TextWidgetState> textKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextWidget(textKey),
          const SizedBox(height: 20,),

          ButtonWidget(
            onPressed: () {
              _init();
            },
          ),
          const SizedBox(height: 20,),
          const Text("点击启动分析"),
          ElevatedButton(
            child: const Text("startA"),
              onPressed: (){
                _startA();
              }),
          const SizedBox(height: 20,),
          const Text("设置收集配置信息"),
          ElevatedButton(
              child:const Text("setConfig"),
              onPressed:() {
                _setConfig();
              }
              )
        ],
      ),
    );
  }


  _setConfig() async{
    TalkingDataSDKConfig config = TalkingDataSDKConfig(IMEIAndMEID: false,MAC:false,Location:false);
    TalkingDataSDK.setConfig(config:config);
  }
  _init() async{
    TalkingDataSDK.initSDK(appID: "Your App ID",channelID: "Your Channel ID",custom: "custom");
  }
  _startA() async{
    TalkingDataSDK.startA();
  }

}

class ButtonWidget extends StatefulWidget {
  OnPressed onPressed;

  ButtonWidget({Key? key, required this.onPressed}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ButtonWidgetState(onPressed);
  }
}

class _ButtonWidgetState extends State<ButtonWidget> {
  final OnPressed _onPressed;

  _ButtonWidgetState(this._onPressed);

  GlobalKey<TextWidgetState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('init',style: TextStyle(fontSize: 20),),
        onPressed: _onPressed,
      ),
    );
  }
}
typedef OnPressed = Function();
class TextWidget extends StatefulWidget {
  const TextWidget(Key key) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TextWidgetState();
  }
}

class TextWidgetState extends State<TextWidget> {
  String _text="点击初始化SDK";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(_text,style: const TextStyle(fontSize: 20),),
    );
  }

  void onPressed(String initText) {
    setState(() {
      _text = initText;
    });
  }
}
