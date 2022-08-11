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
          )
        ],
      ),
    );
  }


  _init() async{
    TalkingDataSDK.init(appID: "Your App ID",channelID: "Your Channel ID",custom: "custom");
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
      child: RaisedButton(
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
