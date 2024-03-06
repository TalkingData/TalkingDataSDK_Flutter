import 'package:flutter/material.dart';
import 'package:talkingdata_sdk_plugin/talkingdata_sdk_plugin.dart';
import 'dart:io';
class GetOAIDPage extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GetOAIDPageState();
  }

}

class _GetOAIDPageState extends State<GetOAIDPage>{
  late String oaid;
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
              Future.delayed(const Duration(seconds:3),(){
                if(Platform.isAndroid){
                  _setOAID();
                }else {
                  textKey.currentState?.onPressed("IOS not support!");
                }
              });
            },
          )
        ],
      ),
    );
  }


  _setOAID() async{
    oaid =  (await TalkingDataSDK.getOAID())!;
    textKey.currentState?.onPressed(oaid);
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
        child: const Text('getOAID',style: TextStyle(fontSize: 20),),
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
  String _text="点击获取oaid";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(_text,style: const TextStyle(fontSize: 20),),
    );
  }

  void onPressed(String oaid) {
    setState(() {
      _text = oaid;
    });
  }
}
