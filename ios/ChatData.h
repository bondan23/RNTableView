//
//  ChatData.h
//  TableViewBridging
//
//  Created by Bondan Eko Prasetyo on 22/03/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChatData : NSObject
  @property(nonatomic,assign) NSString *message;
  @property(nonatomic,assign) NSString *senderName;
- (instancetype)initWithMessage:(NSString *)messages senderName:(NSString *) senderName;
@end
