//  Created by react-native-create-bridge

#import <Foundation/Foundation.h>
#import "RNTableView.h"
#import "RNTableViewManager.h"
#import <React/RCTUIManager.h>

// import RCTBridge
#if __has_include(<React/RCTBridge.h>)
#import <React/RCTBridge.h>
#elif __has_include(“RCTBridge.h”)
#import “RCTBridge.h”
#else
#import “React/RCTBridge.h” // Required when used as a Pod in a Swift project
#endif

@implementation RNTableViewManager

@synthesize bridge = _bridge;

// Export a native module
// https://facebook.github.io/react-native/docs/native-modules-ios.html
RCT_EXPORT_MODULE();

// Return the native view that represents your React component
- (UIView *)view
{
  return [[RNTableView alloc] initWithEventDispatcher:self.bridge.eventDispatcher];
}

RCT_EXPORT_VIEW_PROPERTY(exampleProp, NSString)
RCT_EXPORT_VIEW_PROPERTY(onScroll, RCTDirectEventBlock)
RCT_EXPORT_METHOD(scrollToEnd:(nonnull NSNumber *)reactTag)
{
  [self.bridge.uiManager addUIBlock:
   ^(__unused RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry){
     UIView *view = viewRegistry[reactTag];
     if ([view conformsToProtocol:@protocol(RNTableViewProtocol)]) {
       [(id<RNTableViewProtocol>)view scrollToEnd];
     } else {
       RCTLogError(@"tried to scrollTo: on non-RCTScrollableProtocol view %@ "
                   "with tag #%@", view, reactTag);
     }
   }];
}

RCT_EXPORT_METHOD(appendData:(nonnull NSNumber *)reactTag message:(NSString *)message senderName:(NSString *)senderName)
{
  [self.bridge.uiManager addUIBlock:
   ^(__unused RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry){
     UIView *view = viewRegistry[reactTag];
     if ([view conformsToProtocol:@protocol(RNTableViewProtocol)]) {
       [(id<RNTableViewProtocol>)view appendMessage:message senderName:senderName];
     } else {
       RCTLogError(@"tried to scrollTo: on non-RCTScrollableProtocol view %@ "
                   "with tag #%@", view, reactTag);
     }
   }];
}

// Export constants
// https://facebook.github.io/react-native/releases/next/docs/native-modules-ios.html#exporting-constants
- (NSDictionary *)constantsToExport
{
  return @{
           @"EXAMPLE": @"example"
         };
}

@end
