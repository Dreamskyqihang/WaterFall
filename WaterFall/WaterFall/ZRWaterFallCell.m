//
//  ZRWaterFallCell.m
//  WaterFall
//
//  Created by ZR_yun on 15/11/1.
//  Copyright © 2015年 ZR_yun. All rights reserved.
//

#import "ZRWaterFallCell.h"

@implementation ZRWaterFallCell
#pragma mark init methods
- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:self.bounds];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont boldSystemFontOfSize:25];
        _label.textColor = [UIColor blackColor];
    }
    return _label;
}

#pragma mark lifecycle
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.label];
    }
    return self;
}

@end
