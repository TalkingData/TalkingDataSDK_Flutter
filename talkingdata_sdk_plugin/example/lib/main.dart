import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';

import 'page_config.dart';
import 'page/page_base.dart';
import 'util.dart';
import 'page/profile.dart';
import 'app_route_observer.dart';


void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    // handle Exception
  };
  runZoned(
    () => runApp(MaterialApp(
        title: 'Navigation Basics',
        initialRoute: '/',
        routes: {
          '/': (context) => MainPage(),
          '/base_function': (context) => BasePage(),
          '/profile': (context) => ProfilePage(),
        },
        navigatorObservers: [
          TalkingDataRouteObserver()
        ],
      )),
    onError: (Object obj, StackTrace stack){
      // handle async Exception
    },
  );


}


class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('TalkingData SDK Demo'),
      ),
      body: ModuleList(),
    );
  }
}




class ModuleList extends StatefulWidget{
  final List<MainPageItemDetail> confList = [];
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListState();
  }

}

class ListState extends State<ModuleList>{
  final List<MainPageItemDetail> confList = [];
  var isInitialized = false;

  void _initData(){
    final rootBundle = DefaultAssetBundle.of(context);
    Future<String> config = Util.loadAsset(rootBundle, 'assets/config.json');

    config.then((value){
      Map<String, dynamic> confJson = jsonDecode(value);
      List<dynamic> confArray = confJson['pageConfig'];

      var iterator = confArray.iterator;
      while(iterator.moveNext()){
        confList.add(MainPageItemDetail(
            icon: iterator.current['icon'],
            title: iterator.current['title'],
            content: iterator.current['content'],
            pageName: iterator.current['pageName']
        ));
      }
      setState(() {
        isInitialized = true;
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    if(!isInitialized){
      _initData();
    }

    return ListView.builder(
        itemCount: confList.length,
        itemBuilder: (context, index){
          return ListTile(
            title: ModuleItem(confList[index]),
            onTap: (){
              _onItemClick(index);
            },
          );
        }
    );
  }

  void _onItemClick(int index){
    Navigator.pushNamed(
      context,
      '/base_function',
      arguments: {
        'title': confList[index].title,
        'pageName': confList[index].pageName
      }
    );
  }
}


class ModuleItem extends StatelessWidget{
  final MainPageItemDetail mainPageItemDetail;

  const ModuleItem(
      this.mainPageItemDetail
      );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        child: Container(
          constraints: const BoxConstraints.expand(
            height: 100,
          ),
          child: Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10),
                child: Image(
                  width: 50,
                  height: 50,
                  image: AssetImage(mainPageItemDetail.icon),
                ),
              ),
              Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                            mainPageItemDetail.title,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                                fontWeight: FontWeight.w600
                            ),
                            softWrap: true,
                        ),
                        Text(
                          mainPageItemDetail.content,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
              )
            ],
          ),
        )
    );
  }
}