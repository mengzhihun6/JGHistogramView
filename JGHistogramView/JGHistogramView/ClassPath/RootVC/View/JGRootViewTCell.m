//
//  JGRootViewTCell.m
//  JGHistogramView
//
//  Created by spring on 2020/7/3.
//  Copyright © 2020 spring. All rights reserved.
//

#import "JGRootViewTCell.h"

@implementation JGRootViewTCell

- (void)configUI {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor whiteColor];
    
    _TitleLbl = [UILabel new];
    _TitleLbl.textColor = JGHexColor(@"#333333");
    _TitleLbl.font = JGFont(kWidthScale(14));
    _TitleLbl.text = @"登录";
    
    UIView *Line = [UIView new];
    Line.backgroundColor = JGHexColor(@"#f0f0f0");
    
    [self addSubview:_TitleLbl];
    [self addSubview:Line];

    [_TitleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.mas_left).mas_offset(15);
    }];
    
    [Line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self);
        make.height.equalTo(@(1));
    }];
    
}


@end
