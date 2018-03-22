//  Created by react-native-create-bridge
#import <Foundation/Foundation.h>
#import "RNTableView.h"
#import "ChatData.h"
#import <React/UIView+React.h>

// import RCTEventDispatcher
#if __has_include(<React/RCTEventDispatcher.h>)
#import <React/RCTEventDispatcher.h>
#elif __has_include(“RCTEventDispatcher.h”)
#import “RCTEventDispatcher.h”
#else
#import “React/RCTEventDispatcher.h” // Required when used as a Pod in a Swift project
#endif

@interface RNTableView()<UITableViewDataSource, UITableViewDelegate>
  @property (strong, nonatomic) UITableView *tableView;
@end

@implementation RNTableView : UIView  {
  RCTEventDispatcher *_eventDispatcher;
  NSMutableArray *_datasource;
}

- (instancetype)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher
{
  if ((self = [super init])) {
    _eventDispatcher = eventDispatcher;
    [self createTableView];
    _datasource = [NSMutableArray new];
    for (int i = 1; i <= 20; i++){
      NSString *message = [NSString stringWithFormat:@"Test %ld", (long)i];
      ChatData *chatData = [[ChatData alloc] initWithMessage:message senderName:@"Bondan"];
      [_datasource addObject:chatData];
    }
  }
    
  return self;
}

//-(void)layoutSubviews {
//
//}

- (void) createTableView {
  _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
  _tableView.dataSource = self;
  _tableView.delegate = self;
  _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
  _tableView.frame = self.bounds;
  _tableView.transform = CGAffineTransformMakeScale(1, -1);
  [self addSubview:_tableView];
}


#pragma Tableview Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [_datasource count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  NSLog(@"Test %ld", ((long)indexPath.row + 1));
  static NSString *cellIdentifier = @"cellIdentifier";
  UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
  cell.textLabel.text = [NSString stringWithFormat:@"Pesan : %@ Dikirim oleh %@", [[_datasource objectAtIndex:indexPath.row] message],[[_datasource objectAtIndex:indexPath.row] senderName]];
  cell.selectionStyle = UITableViewCellSelectionStyleNone;
  [cell.textLabel sizeToFit];
  cell.textLabel.numberOfLines = 0;
  cell.contentView.transform = CGAffineTransformMakeScale(1, -1);
  return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
  if (!self.onScroll) {
    // When rendering, `self.tableView.delegate` may be set before `onScroll` is passed in.
    return;
  }
  
  self.onScroll(@{
                  @"target": self.reactTag,
                  @"contentOffset": @{
                      @"x": @(_tableView.contentOffset.x),
                      @"y": @(_tableView.contentOffset.y)
                      }
                  });
}

#pragma ScrollAble Protocol
- (void)scrollToEnd {
  NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
  [_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

- (void)appendMessage:(NSString *)message senderName:(NSString *)senderName {
  ChatData *chatData = [[ChatData alloc] initWithMessage:message senderName:senderName];
  [_datasource insertObject:chatData atIndex:0];
  [_tableView reloadData];
}

@end
