#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import <talkingdata_sdk_plugin/TalkingDataSDKPlugin.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
    [TalkingDataSDKPlugin init:@"1" channelId:@"2" custom:@"custom"];
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
