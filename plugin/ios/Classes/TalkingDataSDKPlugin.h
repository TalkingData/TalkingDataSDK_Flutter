#import <Flutter/Flutter.h>

@interface TalkingDataSDKPlugin : NSObject<FlutterPlugin>

/// SDK初始化
/// @param appKey 应用的唯一标识，统计后台注册得到
/// @param channelID 渠道名，如“app store”（可选）
+ (void)init:(NSString*)appId channelId:(NSString*)channelId custom:(NSString *)custom;
@end
