import 'package:flutter/widgets.dart';
import 'package:talkingdata_sdk_plugin/talkingdata_sdk_plugin.dart';
class TalkingDataRouteObserver extends RouteObserver<PageRoute>{
  String _getRouteName(Route<dynamic> route) => route.settings.name;


  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute){
    super.didPush(route, previousRoute);
    if (previousRoute is PageRoute && route is PageRoute) {
      if(previousRoute.settings.name != null){
        TalkingDataSDK.onPageEnd(previousRoute.settings.name);
      }

      if(route.settings.name != null){
        TalkingDataSDK.onPageBegin(route.settings.name);
      }
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute is PageRoute && route is PageRoute) {
      if(route.settings.name != null){
        TalkingDataSDK.onPageEnd(route.settings.name);
      }

      if(previousRoute.settings.name != null){
        TalkingDataSDK.onPageBegin(previousRoute.settings.name);
      }
    }
  }

  @override
  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute) {
      if(oldRoute.settings.name != null){
        TalkingDataSDK.onPageEnd(oldRoute.settings.name);
      }

      if(newRoute.settings.name != null){
        TalkingDataSDK.onPageBegin(newRoute.settings.name);
      }
    }
  }

}