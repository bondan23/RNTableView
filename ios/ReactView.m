//
//  ReactView.m
//  TableViewBridging
//
//  Created by Bondan Eko Prasetyo on 22/03/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import "ReactView.h"
#import <React/RCTEventDispatcher.h>

@implementation ReactView : UIView {
  RCTEventDispatcher *_eventDispatcher;
  UIView *_childView;
}

- (instancetype)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher{
  if((self = [super init])){
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

- (void)setExampleProp:(NSString *)exampleProp{
  if(![exampleProp isEqual:_exampleProp]){
    _exampleProp = [exampleProp copy];
    [self addTextView:_exampleProp];
  }
}

- (void)addTextView:(NSString *)text{
  UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
  textLabel.text = text;
  textLabel.textColor = [UIColor whiteColor];
  [textLabel sizeToFit];
  textLabel.numberOfLines = 1;
  [_childView addSubview:textLabel];
  [_childView setNeedsDisplay];
}

@end
