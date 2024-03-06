import 'package:flutter/material.dart';
import 'package:talkingdata_sdk_plugin/talkingdata_sdk_plugin.dart';

class IndustryPage extends StatefulWidget {
  @override
  _IndustryPageState createState() => _IndustryPageState();
}

class _IndustryPageState extends State<IndustryPage> {
  late String deviceID;
  late String oaid;

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
        body: ListView(
          children: [
            ElevatedButton(child: const Text('onCreateCard'),onPressed: (){
              String profile = "user01";
              String method = "WePay";
              String content = "Game-Item-02";
              TalkingDataSDK.onCreateCard(profile,method,content);
            }),
            ElevatedButton(
                child: const Text('onReceiveDeepLink'),
                onPressed: () {
                  String link = "https://www.talkingdata.com";
                  TalkingDataSDK.onReceiveDeepLink(link);
                }),
            ElevatedButton(child: const Text('onFavorite'),onPressed: (){
              String category = "book";
              String content = "GodFather";
              TalkingDataSDK.onFavorite(category,content);
            }),
            ElevatedButton(
                child: const Text('onShare'),
                onPressed: () {
                  String profile = "user01";
                  String content = "best content";
                  TalkingDataSDK.onShare(profile, content);
                }),
            ElevatedButton(
                child: const Text('onPunch'),
                onPressed: () {
                  String profile = "user01";
                  String punchid = "punchId01";
                  TalkingDataSDK.onPunch(profile, punchid);
                }),
            ElevatedButton(
                child: const Text('onSearch'),
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
            ElevatedButton(
                child: const Text('onReservation'),
                onPressed: () {
                  String profile = "user01";
                  String reservationId = "100921";
                  String category = "hotel";
                  int amount = 1;
                  String term = "MyTerm";
                  TalkingDataSDK.onReservation(
                      profile, reservationId, category, amount, term);
                }),
            ElevatedButton(
                child: const Text('onBooking'),
                onPressed: () {
                  String profile = "user01";
                  String bookId = "60018";
                  String category = "hotel";
                  int amount = 1;
                  String term = "MyTerm";
                  TalkingDataSDK.onBooking(
                      profile, bookId, category, amount, term);
                }),
            ElevatedButton(
                child: const Text('onContact'),
                onPressed: () {
                  String profile = "user01";
                  String content = "MyContent";
                  TalkingDataSDK.onContact(profile, content);
                }),
            ElevatedButton(child: const Text('onViewItem'),onPressed: (){
              String category = "Book";
              String itemId = "9112";
              String name = "GodFather";
              int unitPrice = 99;
              TalkingDataSDK.onViewItem(itemId,category,name,unitPrice);
            }),
            ElevatedButton(
                child: const Text('onViewShoppingCart'),
                onPressed: () {
                  TalkingDataShoppingCart shoppingCart = TalkingDataShoppingCart();
                  shoppingCart.addItem(
                      'itemID331135516', 'Food', 'apple', 33, 11);
                  shoppingCart.addItem(
                      'itemID333103428', 'Food', 'banana', 777, 888);
                  TalkingDataSDK.onViewShoppingCart(shoppingCart);
                }),
            ElevatedButton(
                child: const Text('onPlaceOrder'),
                onPressed: () {
                  TalkingDataOrder order = TalkingDataOrder(
                    orderID: 'orderID102',
                    totalPrice: 1,
                    currencyType: 'CNY',
                  );
                  order.addItem('testID', 'Food', 'apple', 22, 33);
                  String profileId = "user-01";
                  TalkingDataSDK.onPlaceOrder(profileId,order);
                }),
            ElevatedButton(
                child: const Text('onPay'),
                onPressed: () {
                  String profile = "user01";
                  String orderId = "order01";
                  int amount = 1077600;
                  String currencyType = "CNY";
                  String payType = "AliPay";
                  String itemId = "item01";
                  int itemCount = 999;
                  TalkingDataSDK.onPay(profile,orderId,amount,currencyType,payType,itemId,itemCount);
                }),
            ElevatedButton(
                child: const Text('onLearn'),
                onPressed: () {
                  String profile = "user01";
                  String course = "Math";
                  int begin = 1586669180;
                  int duration = 3600;
                  TalkingDataSDK.onLearn(
                      profile, course, begin, duration);
                }),
            ElevatedButton(
                child: const Text('onRead'),
                onPressed: () {
                  String profile = "user01";
                  String book = "English";
                  int begin = 1586669180;
                  int duration = 3600;
                  TalkingDataSDK.onRead(profile, book, begin, duration);
                }),
            ElevatedButton(
                child: const Text('onBrowse'),
                onPressed: () {
                  String profile = "user01";
                  String content = "content";
                  int begin = 1586669180;
                  int duration = 3600;
                  TalkingDataSDK.onBrowse(
                      profile, content, begin, duration);
                }),
            ElevatedButton(
                child: const Text('onTransaction'),
                onPressed: () {
                  TalkingDataTransaction transaction = TalkingDataTransaction(
                      transactionId:"transaction-001",
                      category:"Food",
                      amount:12,
                      personA:"Jim",
                      personB:"Tom",
                      startDate:1586669180,
                      endDate:1587101180,
                      currencyType:"CNY",
                      content:"Chicken");
                  TalkingDataSDK.onTransaction("user-01", transaction);
                }),
            ElevatedButton(
                child: const Text('onCredit'),
                onPressed: () {
                  String profile = "user01";
                  int amount = 2;
                  String content = "content";
                  TalkingDataSDK.onCredit(profile, amount, content);
                }),
            ElevatedButton(
                child: const Text('onChargeBack'),
                onPressed: () {
                  String profile = "user01";
                  String orderid = "oid01";
                  String reason = "reason";
                  String type = "type01";
                  TalkingDataSDK.onChargeBack(
                      profile, orderid, reason, type);
                }),
            ElevatedButton(
                child: const Text('onCreateRole'),
                onPressed: () {
                  String name = "BatMan";
                  TalkingDataSDK.onCreateRole(name);
                }),
            ElevatedButton(
                child: const Text('onTrialFinished'),
                onPressed: () {
                  String profile = "user01";
                  String content = "Gaming";
                  TalkingDataSDK.onTrialFinished(profile, content);
                }),
            ElevatedButton(
                child: const Text('onGuideFinished'),
                onPressed: () {
                  String profile = "user01";
                  String content = "Gaming";
                  TalkingDataSDK.onGuideFinished(profile, content);
                }),
            ElevatedButton(
                child: const Text('onPreviewFinished'),
                onPressed: () {
                  String profile = "user01";
                  String content = "Gaming";
                  TalkingDataSDK.onPreviewFinished(profile, content);
                }),
            ElevatedButton(
                child: const Text('onFreeFinished'),
                onPressed: () {
                  String profile = "user01";
                  String content = "Gaming";
                  TalkingDataSDK.onFreeFinished(profile, content);
                }),
            ElevatedButton(
                child: const Text('onLevelPass'),
                onPressed: () {
                  String profile = "user01";
                  String levelId = "level01";
                  TalkingDataSDK.onLevelPass(profile, levelId);
                }),
            ElevatedButton(
                child: const Text('onAchievementUnlock'),
                onPressed: () {
                  String profile = "user01";
                  String achievementId = "achievement01";
                  TalkingDataSDK.onAchievementUnlock(
                      profile, achievementId);
                }),
            ElevatedButton(
                child: const Text('onOrderPaySucc'),
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
