#import <Flutter/Flutter.h>

@interface TalkingDataSDKPlugin : NSObject<FlutterPlugin>
/// SDK初始化
+ (void)initSDK:(NSString*)appId channelId:(NSString*)channelId custom:(NSString *)custom;
+ (void)startA;
@end
