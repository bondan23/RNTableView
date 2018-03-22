//
//  ChatData.m
//  TableViewBridging
//
//  Created by Bondan Eko Prasetyo on 22/03/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import "ChatData.h"

@implementation ChatData
- (instancetype)initWithMessage:(NSString *)messages senderName:(NSString *)senderName {
  self = [super init];
  _message = messages;
  _senderName = senderName;
  return self;
}
@end
