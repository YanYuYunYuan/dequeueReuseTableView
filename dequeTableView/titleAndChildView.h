//
//  titleAndChildView.h
//  dequeTableView
//
//  Created by 烟雨云渊 on 2017/9/9.
//  Copyright © 2017年 YW. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *titleAndChildViewIdentifier = @"titleAndChildViewIdentifier";
@interface titleAndChildView : UITableViewHeaderFooterView
@property (nonatomic, copy) NSString *theTitle;
@property (nonatomic, copy) NSString *couse;
@end
