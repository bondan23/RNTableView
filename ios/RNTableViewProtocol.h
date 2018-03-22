//
//  RNTableProtocol
//  TableViewBridging
//
//  Created by Bondan Eko Prasetyo on 22/03/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RNTableViewProtocol
  - (void)scrollToEnd;
  - (void)appendMessage:(NSString *)message senderName:(NSString *)senderName;
@end
