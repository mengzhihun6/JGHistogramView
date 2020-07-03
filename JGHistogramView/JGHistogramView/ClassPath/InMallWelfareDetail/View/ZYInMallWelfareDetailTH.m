//
//  ZYInMallWelfareDetailTH.m
//  WSCollege
//
//  Created by spring on 2020/6/9.
//  Copyright © 2020 JG. All rights reserved.
//

#import "ZYInMallWelfareDetailTH.h"
#import "ZYHistogramView.h"

@interface ZYInMallWelfareDetailTH ()
//柱状图
@property (nonatomic, strong) ZYHistogramView *HistogramV;

@property (nonatomic, strong) UILabel *GetLbl;
@property (nonatomic, strong) UILabel *DisLbl;

@end


@implementation ZYInMallWelfareDetailTH


- (void)configUI {
    
    _HistogramV = [[ZYHistogramView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kWidthScale(254))];
    _HistogramV.isHiddenYAxis = YES;
    _HistogramV.ShowBgColor = JGHexColor(@"#EEEFEF");
    _HistogramV.YAxisArrM = @[@"0",@"1",@"2",@"3",@"4",@"5"];
    _HistogramV.ColorsArrM = @[JGHexColor(@"#BF0000"),JGHexColor(@"#558DD5")];
    _HistogramV.XTitlesArrM = @[@"收入",@"扣减"];
    _HistogramV.ScoreArrM = @[@[@(2),@(4)],@[@(4),@(2)],@[@(2),@(5)],@[@(1),@(3)],@[@(2),@(3)],@[@(2),@(1)],@[@(4),@(1)]];
    
    
    _GetLbl = [UILabel new];
    _GetLbl.textColor = JGHexColor(@"#4F4F4F");
    _GetLbl.font = JGFont(kWidthScale(14));
    _GetLbl.text = @"当日总收入：0点";
    
    _DisLbl = [UILabel new];
    _DisLbl.textColor = JGHexColor(@"#4F4F4F");
    _DisLbl.font = JGFont(kWidthScale(14));
    _DisLbl.text = @"当日总扣减：0点";
    
    [self addSubview:_HistogramV];
    [self addSubview:_GetLbl];
    [self addSubview:_DisLbl];
    
    
    [_HistogramV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
        make.height.equalTo(@(kWidthScale(254)));
    }];
    
    
    [_GetLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).mas_offset(15);
        make.top.equalTo(_HistogramV.mas_bottom).mas_offset(kWidthScale(8));
    }];
    
    [_DisLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_GetLbl.mas_left);
        make.top.equalTo(_GetLbl.mas_bottom).mas_offset(kWidthScale(5));
    }];
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
