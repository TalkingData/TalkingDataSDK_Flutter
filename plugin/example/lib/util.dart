import 'package:flutter/services.dart';

class Util{
  static Future<String> loadAsset(AssetBundle rootBundle, String filePath) async {
    return await rootBundle.loadString(filePath);
  }
}