//
//  ReactViewManager.m
//  TableViewBridging
//
//  Created by Bondan Eko Prasetyo on 22/03/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import "ReactViewManager.h"
#import <React/RCTBridge.h>

@implementation ReactViewManager

@synthesize bridge = _bridge;

RCT_EXPORT_MODULE()

- (UIView *)view
{
    ReactView *rctView = [[ReactView alloc]initWithEventDispatcher:self.bridge.eventDispatcher];
  return rctView;
}

RCT_EXPORT_VIEW_PROPERTY(exampleProp, NSString);

- (NSDictionary *)constantsToExport {
  return @{
           @"EXAMPLE":@"this is good example"
           };
}


@end
