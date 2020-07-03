//
//  ZYMLibraryDetailTH.m
//  WSCollege
//
//  Created by spring on 2020/6/8.
//  Copyright © 2020 JG. All rights reserved.
//

#import "ZYMLibraryDetailTH.h"
#import "ZYHistogramView.h"

@interface ZYMLibraryDetailTH ()
//柱状图
@property (nonatomic, strong) ZYHistogramView *HistogramV;

@property (nonatomic, strong) UILabel *TitleLbl;
@property (nonatomic, strong) UILabel *TimeLbl;

@end


@implementation ZYMLibraryDetailTH

- (void)configUI {
    
    _HistogramV = [[ZYHistogramView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kWidthScale(254))];
    _HistogramV.YAxisArrM = @[@"0",@"2",@"4",@"6",@"8",@"10"];
    _HistogramV.isGradient = YES;
    _HistogramV.ShowBgColor = JGHexColor(@"#FFE6E3");
    _HistogramV.ColorsArrM = @[JGHexColor(@"#FF6D00")];
    _HistogramV.XTitlesArrM = @[@"一周积分"];
    _HistogramV.ScoreArrM = @[@[@(2)],@[@(4)],@[@(8)],@[@(6)],@[@(8)],@[@(2)],@[@(6)]];
    
    
    _TitleLbl = [UILabel new];
    NSString *title = @"当日积分： 2";
    NSRange range = [title rangeOfString:@"2"];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:title attributes:@{NSFontAttributeName: JGFont(kWidthScale(14)),NSForegroundColorAttributeName: JGHexColor(@"#FF6D00")}];
    [string addAttributes:@{NSFontAttributeName: JGFont(kWidthScale(20))} range:range];
    _TitleLbl.attributedText = string;
    
    _TimeLbl = [UILabel new];
    _TimeLbl.textColor = JGHexColor(@"#6B6868");
    _TimeLbl.font = JGFont(kWidthScale(12));
    _TimeLbl.text = @"2019-10-18";
    
    [self addSubview:_HistogramV];
    [self addSubview:_TitleLbl];
    [self addSubview:_TimeLbl];

    
    [_HistogramV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
        make.height.equalTo(@(kWidthScale(254)));
    }];
    
    [_TitleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).mas_offset(15);
        make.bottom.equalTo(self.mas_bottom);
        make.height.equalTo(@(kWidthScale(36)));
    }];
    
    [_TimeLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).mas_offset(-15);
        make.centerY.equalTo(_TitleLbl.mas_centerY);
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
