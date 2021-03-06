//  Created by react-native-create-bridge

// import UIKit so you can subclass off UIView
#import <UIKit/UIKit.h>
#import <React/RCTComponent.h>
#import "RNTableViewProtocol.h"

@class RCTEventDispatcher;

@interface RNTableView : UIView <RNTableViewProtocol>
  // Define view properties here with @property
  @property (nonatomic, assign) NSString *exampleProp;

  // Initializing with the event dispatcher allows us to communicate with JS
  - (instancetype)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher NS_DESIGNATED_INITIALIZER;
  @property(nonatomic, copy) RCTDirectEventBlock onScroll;
//  @property(nonatomic, copy) RCTDirectEventBlock scrollToBottom;

@end
