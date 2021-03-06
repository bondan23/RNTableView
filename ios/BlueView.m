//  Created by react-native-create-bridge
#import <Foundation/Foundation.h>
#import "BlueView.h"

// import RCTEventDispatcher
#if __has_include(<React/RCTEventDispatcher.h>)
#import <React/RCTEventDispatcher.h>
#elif __has_include(“RCTEventDispatcher.h”)
#import “RCTEventDispatcher.h”
#else
#import “React/RCTEventDispatcher.h” // Required when used as a Pod in a Swift project
#endif


@implementation BlueView : UIView  {

  RCTEventDispatcher *_eventDispatcher;
  UIView *_childView;
}

- (instancetype)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher
{
  if ((self = [super init])) {
    _eventDispatcher = eventDispatcher;
    _childView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    _childView.backgroundColor = [UIColor blueColor];
  }
    
  return self;
}

- (void)layoutSubviews{
  _childView.frame = self.bounds;
  [self addSubview:_childView];
}

@end
