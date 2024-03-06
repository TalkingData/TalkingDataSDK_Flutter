import 'package:flutter/material.dart';
import 'package:talkingdata_sdk_plugin/talkingdata_sdk_plugin.dart';

class StandardEventPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final ButtonStyle  buttonStyle = ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent
    );

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: ListView(
        children: <Widget>[
          const Text('提供标准化事件接口，便于开发者快速集成关键操作追踪，并基于标准化事件，提供针对性的分析服务。'),
          const Text(
              '电商定制',
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[

                  Expanded(
                    child: ElevatedButton(
                        child: const Text(
                            '查看商品',
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                        onPressed: _onViewItem,
                        style: buttonStyle
                    ),
                    flex: 1,
                  ),
                  Container(
                    width: 16,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      child: const Text(
                        '添加购物车',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                      onPressed: _onAddItemToShoppingCart,
                      style: buttonStyle,
                    ),
                    flex: 1,
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      child: const Text(
                        '查看购物车',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                      onPressed: _onViewShoppingCart,
                      style: buttonStyle,
                    ),
                    flex: 1,
                  ),
                  Container(
                    width: 16,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      child: const Text(
                        '订单',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                      onPressed: _onPlaceOrder,
                      style: buttonStyle,
                    ),
                    flex: 1,
                  )
                ],
              ),
              Row(
                children: <Widget>[
                   Expanded(
                    child: ElevatedButton(
                      child: const Text(
                        '支付订单',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                      onPressed: _onOrderPaySucc,
                      style: buttonStyle,
                    ),
                    flex: 1,
                  ),
                  Container(
                    width: 16,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      child:const Text(
                        '取消订单',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                      onPressed: _onCancelOrder,
                      style: buttonStyle,
                    ),
                    flex: 1,
                  )
                ],
              ),

            ],
          )
        ],
      ),
    );
  }
}


void _onViewItem(){
  TalkingDataSDK.onViewItem('itemID331135516', 'Food', 'apple', 44);
}

void _onAddItemToShoppingCart(){
  TalkingDataSDK.onAddItemToShoppingCart('itemID331135516', 'Food', 'apple', 22, 33);
}

void _onViewShoppingCart(){
  TalkingDataShoppingCart shoppingCart = TalkingDataShoppingCart();
  shoppingCart.addItem('itemID331135516', 'Food', 'apple', 33, 11);
  shoppingCart.addItem('itemID333103428', 'Food', 'banana', 777, 888);
  TalkingDataSDK.onViewShoppingCart(shoppingCart);
}

void _onCancelOrder(){
  TalkingDataOrder order = TalkingDataOrder(
    orderID: 'testOrderID',
    totalPrice: 1,
    currencyType: 'CNY',
  );
  order.addItem('testID', 'Food', 'apple', 22, 33);
  TalkingDataSDK.onCancelOrder(order);
}
void _onPlaceOrder(){
  TalkingDataOrder order = TalkingDataOrder(
    orderID: 'testOrderID',
    totalPrice: 1,
    currencyType: 'CNY',
  );
  order.addItem('testID', 'Food', 'apple', 22, 33);
  String profileID = "testProfile";
  TalkingDataSDK.onPlaceOrder(
    profileID,order
  );
}

void _onOrderPaySucc(){
  TalkingDataOrder order = TalkingDataOrder(
    orderID: 'testOrderID',
    totalPrice: 1,
    currencyType: 'CNY',
  );
  order.addItem('testID', 'Food', 'apple', 22, 33);
  TalkingDataSDK.onOrderPaySucc(order, 'Alipay','testProfile',);
}