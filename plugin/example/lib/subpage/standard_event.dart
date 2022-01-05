import 'package:flutter/material.dart';
import 'package:talkingdata_sdk_plugin/talkingdata_sdk_plugin.dart';

class StandardEventPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: ListView(
        children: <Widget>[
          Text('提供标准化事件接口，便于开发者快速集成关键操作追踪，并基于标准化事件，提供针对性的分析服务。'),
          Text(
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
                    child: RaisedButton(
                        child: Text(
                            '查看商品',
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                        onPressed: _onViewItem,
                        color: Colors.blueAccent,
                    ),
                    flex: 1,
                  ),
                  Container(
                    width: 16,
                  ),
                  Expanded(
                    child: RaisedButton(
                      child: Text(
                        '添加购物车',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                      onPressed: _onAddItemToShoppingCart,
                      color: Colors.blueAccent,
                    ),
                    flex: 1,
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      child: Text(
                        '查看购物车',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                      onPressed: _onViewShoppingCart,
                      color: Colors.blueAccent,
                    ),
                    flex: 1,
                  ),
                  Container(
                    width: 16,
                  ),
                  Expanded(
                    child: RaisedButton(
                      child: Text(
                        '订单',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                      onPressed: _onPlaceOrder,
                      color: Colors.blueAccent,
                    ),
                    flex: 1,
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      child: Text(
                        '支付订单',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                      onPressed: _onOrderPaySucc,
                      color: Colors.blueAccent,
                    ),
                    flex: 1,
                  ),
                  Container(
                    width: 16,
                  ),
                  Expanded(
                    child: RaisedButton(
                      child: Text(
                        '取消订单',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                      onPressed: _onCancelOrder,
                      color: Colors.blueAccent,
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
  TalkingDataSDK.onCancelOrder(order:order);
}
void _onPlaceOrder(){
  TalkingDataOrder order = TalkingDataOrder(
    orderID: 'testOrderID',
    totalPrice: 1,
    currencyType: 'CNY',
  );
  order.addItem('testID', 'Food', 'apple', 22, 33);
  TalkingDataSDK.onPlaceOrder(
    profileID: 'testProfile',
    order: order
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