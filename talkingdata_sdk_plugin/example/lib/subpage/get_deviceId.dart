import 'package:flutter/material.dart';
import 'package:talkingdata_sdk_plugin/talkingdata_sdk_plugin.dart';

class GetDeviceIdPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GetDeviceIdPageState();
  }

}

class _GetDeviceIdPageState extends State<GetDeviceIdPage>{
  String? deviceId;
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
                _setDeviceId();
              });
            },
          )
        ],
      ),
    );
  }


  _setDeviceId() async{
    deviceId =  await TalkingDataSDK.getDeviceID();
    textKey.currentState?.onPressed(deviceId!);
  }
}

class ButtonWidget extends StatefulWidget {
  OnPressed onPressed;

  ButtonWidget({required this.onPressed});

  @override
  State<StatefulWidget> createState() {
    return _ButtonWidgetState(onPressed);
  }
}

class _ButtonWidgetState extends State<ButtonWidget> {
  OnPressed _onPressed;

  _ButtonWidgetState(this._onPressed);

  GlobalKey<TextWidgetState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('getDeviceId',style: TextStyle(fontSize: 20),),
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
  String _text="点击获取DeviceId";

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
