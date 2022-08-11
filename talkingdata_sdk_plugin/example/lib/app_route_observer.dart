import 'package:flutter/widgets.dart';
import 'package:talkingdata_sdk_plugin/talkingdata_sdk_plugin.dart';
class TalkingDataRouteObserver extends RouteObserver<PageRoute>{

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute){
    super.didPush(route, previousRoute);
    if (previousRoute is PageRoute && route is PageRoute) {
      if(previousRoute.settings.name != null){
        String? previousName = previousRoute.settings.name;
        TalkingDataSDK.onPageEnd(previousName!);
      }

      if(route.settings.name != null){
        String? name = route.settings.name;
        TalkingDataSDK.onPageBegin(name!);
      }
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute is PageRoute && route is PageRoute) {
      if(route.settings.name != null){
        String? name = route.settings.name;
        TalkingDataSDK.onPageEnd(name!);
      }

      if(previousRoute.settings.name != null){
        String? previousName = previousRoute.settings.name;
        TalkingDataSDK.onPageBegin(previousName!);
      }
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute) {
      if(oldRoute?.settings.name != null){
        String? oldName = oldRoute?.settings.name;
        TalkingDataSDK.onPageEnd(oldName!);
      }

      if(newRoute.settings.name != null){
        String? newName = newRoute.settings.name;
        TalkingDataSDK.onPageBegin(newName!);
      }
    }
  }

}