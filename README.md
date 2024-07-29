# TalkingData Flutter SDK

TalkingData Flutter 平台 SDK 由`封装层`和`Native SDK`两部分构成，目前Github上提供了封装层代码，需要从 [TalkingData官网](https://www.talkingdata.com/spa/sdk/#/universal?sdkPlatform=Flutter) 下载最新版的 Android 和 iOS 平台 Native SDK，组合使用。



#### 集成说明

1. 下载本项目（封装层）到本地；

2. 访问 [TalkingData官网](https://www.talkingdata.com/spa/sdk/#/universal?sdkPlatform=Flutter) 下载最新版的 Android 和 iOS 平台 TalkingData SDK (Native SDK)

   * 方法1：选择 Flutter平台进行功能定制；
   * 方法2：分别选择 Android 和 iOS 平台进行功能定制，请确保两个平台功能项一致；

3. 将下载的最新版 Native SDK 复制到 封装层 中，构成完整的 Flutter SDK。

   * Android 平台
     将最新的 `.jar `文件复制到 `talkingdata_sdk_plugin/android/libs` 目录下

   * iOS 平台
     将最新的 `.xcframework` 文件复制到 `talkingdata_sdk_plugin/ios/Frameworks` 目录下

4. 按`Native SDK`功能选项对`封装层`代码进行必要的修改，详见“注意事项”第2条；

5. 将 Flutter SDK 集成您需要统计的工程中，并按 [集成文档](http://doc.talkingdata.com/posts/1031) 进行必要配置和功能调用。



#### 功能选择和代码删减

| 事件名称     | 电商零售 | 游戏娱乐 | 金融借贷 | 旅游出行 | 在线教育 | 小说阅读 | 其他行业 |
| ------------ | -------- | -------- | -------- | -------- | -------- | -------- | -------- |
| 联系         | √        | &nbsp;   | √        | √        | √        | &nbsp;   | &nbsp;   |
| 付费         | &nbsp;   | √        | &nbsp;   | √        | √        | √        | √        |
| 退单         | √        | &nbsp;   | √        | √        | √        | &nbsp;   | &nbsp;   |
| 预约         | &nbsp;   | &nbsp;   | √        | &nbsp;   | √        | &nbsp;   | &nbsp;   |
| 预订         | √        | &nbsp;   | &nbsp;   | √        | &nbsp;   | &nbsp;   | &nbsp;   |
| 查看商品     | √        | &nbsp;   | &nbsp;   | &nbsp;   | &nbsp;   | &nbsp;   | &nbsp;   |
| 添加购物车   | √        | &nbsp;   | &nbsp;   | &nbsp;   | &nbsp;   | &nbsp;   | &nbsp;   |
| 查看购物车   | √        | &nbsp;   | &nbsp;   | &nbsp;   | &nbsp;   | &nbsp;   | &nbsp;   |
| 订单         | √        | &nbsp;   | &nbsp;   | &nbsp;   | &nbsp;   | &nbsp;   | &nbsp;   |
| 支付订单     | √        | &nbsp;   | &nbsp;   | &nbsp;   | &nbsp;   | &nbsp;   | &nbsp;   |
| 取消订单     | √        | &nbsp;   | &nbsp;   | &nbsp;   | &nbsp;   | &nbsp;   | &nbsp;   |
| 授信         | &nbsp;   | &nbsp;   | √        | &nbsp;   | &nbsp;   | &nbsp;   | &nbsp;   |
| 交易         | &nbsp;   | &nbsp;   | √        | &nbsp;   | &nbsp;   | &nbsp;   | &nbsp;   |
| 创建角色     | &nbsp;   | √        | &nbsp;   | &nbsp;   | &nbsp;   | &nbsp;   | &nbsp;   |
| 通过关卡     | &nbsp;   | √        | &nbsp;   | &nbsp;   | &nbsp;   | &nbsp;   | &nbsp;   |
| 完成新手教程 | &nbsp;   | √        | &nbsp;   | &nbsp;   | &nbsp;   | &nbsp;   | &nbsp;   |
| 课程学习     | &nbsp;   | &nbsp;   | &nbsp;   | &nbsp;   | √        | &nbsp;   | &nbsp;   |
| 完成课程试听 | &nbsp;   | &nbsp;   | &nbsp;   | &nbsp;   | √        | &nbsp;   | &nbsp;   |
| 文章阅读     | &nbsp;   | &nbsp;   | &nbsp;   | &nbsp;   | &nbsp;   | √        | &nbsp;   |
| 完成免费阅读 | &nbsp;   | &nbsp;   | &nbsp;   | &nbsp;   | &nbsp;   | √        | &nbsp;   |
| 解锁成就     | &nbsp;   | √        | &nbsp;   | &nbsp;   | √        | &nbsp;   | &nbsp;   |
| 浏览详情     | &nbsp;   | &nbsp;   | √        | √        | &nbsp;   | &nbsp;   | √        |
| 完成试用体验 | √        | &nbsp;   | √        | √        | &nbsp;   | &nbsp;   | √        |

当前封装层代码包含了所有行业接口。如果在官网申请的静态库不包含上述功能和业务线，请开发者按照上图对封装层文件进行必要删减。以免对应的接口不存在对应的实现导致报错。需要删减的文件如下：

iOS:

`TalkingDataSDKPlugin.m`

Android:

`TalkingDataSDKPlugin.java`

Dart:

`TalkingDataSDK.js`

举例：

在官网未勾选小说阅读行业。那么请对照上表，删除小说阅读行业对应的接口。这里以文章阅读接口作为举例：

删除`TalkingDataSDKPlugin.m`的:

```
[TalkingDataSDK onRead:profile book:book begin:begin.intValue duration:duration.intValue];
```

删除`TalkingDataSDKPlugin.java`的:

```
TalkingDataSDK.onRead(
                (String) call.argument("profile"),
                (String) call.argument("book"),
                callTransInt(call, "begin"),
                callTransInt(call, "duration"));
```

删除`talkingdata_sdk_plugin.dart` 的：

```
static Future<void> onRead(
      String profile, String book, int begin, int duration) async {
    return await _channel.invokeMethod('onRead', <String, dynamic>{
      'profile': profile,
      'book': book,
      'begin': begin,
      'duration': duration
    });
  }
```



#### 运行Demo

将最新的Android/iOS的SDK放入 `plugin` 路径下的对应位置

* Android 平台
  将最新的 `.jar `文件复制到 `android/libs` 目录下

* iOS 平台
  将最新的 `.a`文件复制到 `ios/Assets` 目录下

  将最新的`.h` 文件赋值到`ios/Classes`目录下

连接真机。终端运行：

```
cd example
flutter run
```





## LICENSE & 许可

[MIT LICENSE](LICENSE)
