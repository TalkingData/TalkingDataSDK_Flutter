#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
#import <talkingdata_sdk_plugin/TalkingDataSDKPlugin.h>
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
  [TalkingDataSDKPlugin initSDK:@"您的 App ID" channelId:@"渠道 ID" custom:@"自定义参数"];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
