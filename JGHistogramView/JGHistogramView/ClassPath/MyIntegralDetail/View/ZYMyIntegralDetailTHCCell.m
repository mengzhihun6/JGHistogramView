//
//  ZYMyIntegralDetailTHCCell.m
//  WSCollege
//
//  Created by spring on 2020/6/9.
//  Copyright © 2020 JG. All rights reserved.
//

#import "ZYMyIntegralDetailTHCCell.h"

@interface ZYMyIntegralDetailTHCCell ()

@property (nonatomic, strong) UIView *Bg;

@property (nonatomic, strong) UIView *Line;
@property (nonatomic, strong) UILabel *DateLbl;
@property (nonatomic, strong) UILabel *ScoreLbl;

@property (nonatomic, strong)CAGradientLayer *gradientLayer;

@end


@implementation ZYMyIntegralDetailTHCCell

- (void)configUI {
    
    self.backgroundColor = JGHexColor(@"#F7F7F7");
    
    _Bg = [UIView new];
    _Bg.hidden = YES;
    _Bg.backgroundColor = JGHexColor(@"#FFE5E3");
    
    _Line = [UIView new];
    
    _DateLbl = [UILabel new];
    _DateLbl.textColor = JGHexColor(@"#A9A9A9");
    _DateLbl.font = JGFont(kWidthScale(12));
    _DateLbl.text = @"05.21";
    
    _ScoreLbl = [UILabel new];
    _ScoreLbl.textColor = JGHexColor(@"#A9A9A9");
    _ScoreLbl.font = JGFont(kWidthScale(12));
    _ScoreLbl.text = @"4分";
    
    
    
    [self addSubview:_Bg];
    [self addSubview:_Line];
    [self addSubview:_DateLbl];
    [self addSubview:_ScoreLbl];

    
    [_Bg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [_Line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.bottom.equalTo(self);
        make.width.equalTo(@(kWidthScale(39)));
        make.height.equalTo(@(0));
    }];
    
    [_DateLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.mas_top).mas_offset(kWidthScale(5));
    }];
    
    [_ScoreLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.bottom.equalTo(_Line.mas_top).mas_offset(-kWidthScale(2));
    }];
    
    
    self.gradientLayer =  [CAGradientLayer layer];
    //    self.gradientLayer.locations = @[@(0.0),@(1.0)];//渐变点
    [self.gradientLayer setColors:@[(id)[UIColor colorWithHexCode:@"#F42B00" alpha:0.4].CGColor,(id)[UIColor colorWithHexCode:@"#FF6D00" alpha:0.4].CGColor]];//渐变数组
//    [self.gradientLayer setColors:@[(id)JGHexColor(@"#F42D00").CGColor,(id)JGHexColor(@"#FD6500").CGColor]];//渐变数组

    [_Line.layer insertSublayer:self.gradientLayer atIndex:0];
}


- (void)setScore:(NSInteger)Score {
    _Score = Score;
    
    CGFloat H = kWidthScale(169) / 5 * Score;
    
    [_Line mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(H));
    }];
 
    
}



- (void)showBg {
    
    _Bg.hidden = NO;
    _DateLbl.textColor = JGHexColor(@"#D32F2F");
    _ScoreLbl.textColor = JGHexColor(@"#D32F2F");
    [self.gradientLayer setColors:@[(id)JGHexColor(@"#F42D00").CGColor,(id)JGHexColor(@"#FD6500").CGColor]];//渐变数组


    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _Bg.hidden = YES;
        _DateLbl.textColor = JGHexColor(@"#A9A9A9");
        _ScoreLbl.textColor = JGHexColor(@"#A9A9A9");

        [self.gradientLayer setColors:@[(id)[UIColor colorWithHexCode:@"#F42B00" alpha:0.4].CGColor,(id)[UIColor colorWithHexCode:@"#FF6D00" alpha:0.4].CGColor]];//渐变数组

    });
    
    
}




- (void)layoutSubviews {
    [super layoutSubviews];

    CGFloat w = self.Line.frame.size.width;
    CGFloat h = self.Line.frame.size.height;
    
    self.gradientLayer.frame = CGRectMake(0, 0, w, h);
    [_Line cornerRadius:2 withType:ArbitraryCornerRadiusViewTypeTopLeftTopRight];
}


@end
