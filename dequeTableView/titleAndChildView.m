//
//  titleAndChildView.m
//  dequeTableView
//
//  Created by 烟雨云渊 on 2017/9/9.
//  Copyright © 2017年 YW. All rights reserved.
//

#import "titleAndChildView.h"

@interface titleAndChildView()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *childLabel;
@end

@implementation titleAndChildView
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithReuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self setLayoutSubviews];
    }
    return self;
}

- (void)setTheTitle:(NSString *)theTitle{
    _theTitle = theTitle;
    _titleLabel.text = _theTitle;
}

- (void)setCouse:(NSString *)couse{
    _childLabel.text = couse;
}

- (void)setLayoutSubviews{
    [self.titleLabel setFrame:CGRectMake(15, 0, 100, 35)];
    [self.childLabel setFrame:CGRectMake(130, 0, 150, 35)];
}

- (UILabel*)titleLabel{
    if (!_titleLabel) {
        UILabel* label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentLeft;
        //        label.textColor = [UIColor customTextGrayColor];
        //        label.font = KSmallContentFont;
        [self addSubview:label];
        _titleLabel = label;
    }
    return _titleLabel;
}

- (UILabel*)childLabel{
    if (!_childLabel) {
        UILabel* label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentLeft;
        //        label.textColor = [UIColor customTextGrayColor];
        //        label.font = KSmallContentFont;
        [self addSubview:label];
        _childLabel = label;
    }
    return _childLabel;
}
@end
