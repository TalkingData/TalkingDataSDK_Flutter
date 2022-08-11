import 'subpage/get_deviceId.dart';
import 'subpage/get_oaid.dart';
import 'subpage/init.dart';
import 'package:flutter/material.dart';
import 'industry.dart';
import 'subpage/base_statistics.dart';
import 'subpage/page_statistics.dart';
import 'subpage/custom_event.dart';
import 'subpage/standard_event.dart';

class MainPageItemDetail {
  MainPageItemDetail({this.icon, this.title, this.content, this.pageName});

  var icon;
  var title;
  var content;
  var pageName;
}

class PageSelector {
  static Widget? getPageContent(String pageName) {
    switch (pageName) {
      case 'Init':
        return InitPage();
      case 'BaseStatisticsPage':
        return BaseStatisticsPage();
      case 'PageStatisticsPage':
        return PageStatisticsPage();
      case 'CustomEventPage':
        return CustomEventPage();
      case 'StandardEventPage':
        return StandardEventPage();
      case 'GetOAID':
        return GetOAIDPage();
      case 'GetDeviceId':
        return GetDeviceIdPage();
      case 'GetIndustry':
        return IndustryPage();
    }
    return null;
  }
}
