import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:talkingdata_sdk_plugin/talkingdata_sdk_plugin.dart';

class IndustryPage extends StatefulWidget {
  @override
  _IndustryPageState createState() => _IndustryPageState();
}

class _IndustryPageState extends State<IndustryPage> {
  String _platformVersion = 'Unknown';
  String deviceID;
  String oaid;

  @override
  void initState() {
    super.initState();
    // initPlatformState();
  }

  // // Platform messages are asynchronous, so we initialize in an async method.
  // Future<void> initPlatformState() async {
  //   String platformVersion;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     platformVersion = await TalkingDataUniversal.platformVersion;
  //
  //   } on PlatformException {
  //     platformVersion = 'Failed to get platform version.';
  //   }
  //
  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //   if (!mounted) return;
  //
  //   setState(() {
  //     _platformVersion = platformVersion;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: new ListView(
          children: [
            RaisedButton(child: Text('onCreateCard'),onPressed: (){
              String profile = "user01";
              String method = "WePay";
              String content = "Game-Item-02";
              TalkingDataSDK.onCreateCard(profile,method,content);
            }),
            RaisedButton(
                child: Text('onReceiveDeepLink'),
                onPressed: () {
                  String link = "https://www.talkingdata.com";
                  TalkingDataSDK.onReceiveDeepLink(link);
                }),
            RaisedButton(child: Text('onFavorite'),onPressed: (){
              String category = "book";
              String content = "GodFather";
              TalkingDataSDK.onFavorite(category,content);
            }),
            RaisedButton(
                child: Text('onShare'),
                onPressed: () {
                  String profile = "user01";
                  String content = "best content";
                  TalkingDataSDK.onShare(profile, content);
                }),
            RaisedButton(
                child: Text('onPunch'),
                onPressed: () {
                  String profile = "user01";
                  String punchid = "punchId01";
                  TalkingDataSDK.onPunch(profile, punchid);
                }),
            RaisedButton(
                child: Text('onSearch'),
                onPressed: () {
                  TalkingDataSearch search = TalkingDataSearch(
                    category: "Book",
                    content: "Book's content",
                    itemId: "item-001",
                    itemLocationId: "itemLocationId-001",
                    destination: "Beijing",
                    origin: "ShangHai",
                    startDate: 1586669180,
                    endDate: 1587101180,
                  );
                  TalkingDataSDK.onSearch(search);
                }),
            RaisedButton(
                child: Text('onReservation'),
                onPressed: () {
                  String profile = "user01";
                  String reservationId = "100921";
                  String category = "hotel";
                  int amount = 1;
                  String term = "MyTerm";
                  TalkingDataSDK.onReservation(
                      profile, reservationId, category, amount, term);
                }),
            RaisedButton(
                child: Text('onBooking'),
                onPressed: () {
                  String profile = "user01";
                  String bookId = "60018";
                  String category = "hotel";
                  int amount = 1;
                  String term = "MyTerm";
                  TalkingDataSDK.onBooking(
                      profile, bookId, category, amount, term);
                }),
            RaisedButton(
                child: Text('onContact'),
                onPressed: () {
                  String profile = "user01";
                  String content = "MyContent";
                  TalkingDataSDK.onContact(profile, content);
                }),
            RaisedButton(child: Text('onViewItem'),onPressed: (){
              String category = "Book";
              String itemId = "9112";
              String name = "GodFather";
              int unitPrice = 99;
              TalkingDataSDK.onViewItem(itemId,category,name,unitPrice);
            }),
            RaisedButton(
                child: Text('onViewShoppingCart'),
                onPressed: () {
                  TalkingDataShoppingCart shoppingCart = TalkingDataShoppingCart();
                  shoppingCart.addItem(
                      'itemID331135516', 'Food', 'apple', 33, 11);
                  shoppingCart.addItem(
                      'itemID333103428', 'Food', 'banana', 777, 888);
                  TalkingDataSDK.onViewShoppingCart(shoppingCart);
                }),
            RaisedButton(
                child: Text('onPlaceOrder'),
                onPressed: () {
                  TalkingDataOrder order = TalkingDataOrder(
                    orderID: 'orderID102',
                    totalPrice: 1,
                    currencyType: 'CNY',
                  );
                  order.addItem('testID', 'Food', 'apple', 22, 33);
                  TalkingDataSDK.onPlaceOrder(
                      profileID: 'user-01', order: order);
                }),
            RaisedButton(
                child: Text('onLearn'),
                onPressed: () {
                  String profile = "user01";
                  String course = "Math";
                  int begin = 1586669180;
                  int duration = 3600;
                  TalkingDataSDK.onLearn(
                      profile, course, begin, duration);
                }),
            RaisedButton(
                child: Text('onRead'),
                onPressed: () {
                  String profile = "user01";
                  String book = "English";
                  int begin = 1586669180;
                  int duration = 3600;
                  TalkingDataSDK.onRead(profile, book, begin, duration);
                }),
            RaisedButton(
                child: Text('onBrowse'),
                onPressed: () {
                  String profile = "user01";
                  String content = "content";
                  int begin = 1586669180;
                  int duration = 3600;
                  TalkingDataSDK.onBrowse(
                      profile, content, begin, duration);
                }),
            RaisedButton(
                child: Text('onTransaction'),
                onPressed: () {
                  TalkingDataTransaction transaction = TalkingDataTransaction(
                      "transaction-001",
                      "Food",
                      12,
                      "Jim",
                      "Tom",
                      1586669180,
                      1587101180,
                      "CNY",
                      "Chicken");
                  TalkingDataSDK.onTransaction("user-01", transaction);
                }),
            RaisedButton(
                child: Text('onCredit'),
                onPressed: () {
                  String profile = "user01";
                  int amount = 2;
                  String content = "content";
                  TalkingDataSDK.onCredit(profile, amount, content);
                }),
            RaisedButton(
                child: Text('onChargeBack'),
                onPressed: () {
                  String profile = "user01";
                  String orderid = "oid01";
                  String reason = "reason";
                  String type = "type01";
                  TalkingDataSDK.onChargeBack(
                      profile, orderid, reason, type);
                }),
            RaisedButton(
                child: Text('onCreateRole'),
                onPressed: () {
                  String name = "BatMan";
                  TalkingDataSDK.onCreateRole(name);
                }),
            RaisedButton(
                child: Text('onTrialFinished'),
                onPressed: () {
                  String profile = "user01";
                  String content = "Gaming";
                  TalkingDataSDK.onTrialFinished(profile, content);
                }),
            RaisedButton(
                child: Text('onGuideFinished'),
                onPressed: () {
                  String profile = "user01";
                  String content = "Gaming";
                  TalkingDataSDK.onGuideFinished(profile, content);
                }),
            RaisedButton(
                child: Text('onPreviewFinished'),
                onPressed: () {
                  String profile = "user01";
                  String content = "Gaming";
                  TalkingDataSDK.onPreviewFinished(profile, content);
                }),
            RaisedButton(
                child: Text('onFreeFinished'),
                onPressed: () {
                  String profile = "user01";
                  String content = "Gaming";
                  TalkingDataSDK.onFreeFinished(profile, content);
                }),
            RaisedButton(
                child: Text('onLevelPass'),
                onPressed: () {
                  String profile = "user01";
                  String levelId = "level01";
                  TalkingDataSDK.onLevelPass(profile, levelId);
                }),
            RaisedButton(
                child: Text('onAchievementUnlock'),
                onPressed: () {
                  String profile = "user01";
                  String achievementId = "achievement01";
                  TalkingDataSDK.onAchievementUnlock(
                      profile, achievementId);
                }),
            RaisedButton(
                child: Text('onOrderPaySucc'),
                onPressed: () {
                  String profile = "user-01";
                  String payType = "AliPay";
                  TalkingDataOrder order = TalkingDataOrder(
                    orderID: 'orderID102',
                    totalPrice: 1,
                    currencyType: 'CNY',
                  );
                  order.addItem('testID', 'Food', 'apple', 22, 33);
                  TalkingDataSDK.onOrderPaySucc(order,payType,profile);
                })
          ],
        ),
      ),
    );
  }
}
