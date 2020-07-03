//
//  ZYHistogramViewCCell.m
//  WSCollege
//
//  Created by spring on 2020/5/26.
//  Copyright © 2020 JG. All rights reserved.
//

#import "ZYHistogramViewCCell.h"
#import "ZYHistogramDetailAlert.h"

@interface ZYHistogramViewCCell ()

@property (nonatomic, strong) UIView *Bg;
//左侧
@property (nonatomic, strong) UIView *LeftLine;
//右侧
@property (nonatomic, strong) UIView *RightLine;
//渐变视图
@property (nonatomic, strong)CAGradientLayer *gradientLayer;

@end

@implementation ZYHistogramViewCCell

- (void)configUI {
    
    self.backgroundColor = [UIColor clearColor];

    _Bg = [UIView new];
    _Bg.hidden = YES;
    
    _LeftLine = [UIView new];
    
    _RightLine = [UIView new];

    
    [self addSubview:_Bg];
    [self addSubview:_LeftLine];
    [self addSubview:_RightLine];

    
    [_Bg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [_LeftLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.equalTo(self);
        make.width.equalTo(@(kWidthScale(20)));
        make.height.equalTo(@(0));
     }];
    
    [_RightLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.equalTo(self);
        make.width.equalTo(@(kWidthScale(10)));
        make.height.equalTo(@(0));
    }];
    
    
    
    self.gradientLayer =  [CAGradientLayer layer];
//    self.gradientLayer.locations = @[@(0.0),@(1.0)];//渐变点
    [self.gradientLayer setColors:@[(id)JGHexColor(@"#F42D00").CGColor,(id)JGHexColor(@"#FD6500").CGColor]];//渐变数组
    
    [_LeftLine.layer insertSublayer:self.gradientLayer atIndex:0];
}

- (void)setShowBgColor:(UIColor *)ShowBgColor {
    _ShowBgColor = ShowBgColor;
    
    _Bg.backgroundColor = ShowBgColor;
}


- (void)setColorsArrM:(NSArray *)ColorsArrM {
    _ColorsArrM = ColorsArrM;
    
    if (ColorsArrM.count == 1) {
        
        if (!self.isGradient) {
            _LeftLine.backgroundColor = [ColorsArrM firstObject];
        }
    }else {
        
        _LeftLine.backgroundColor = [ColorsArrM firstObject];
        _RightLine.backgroundColor = [ColorsArrM lastObject];
    }
}



- (void)setScoreArrM:(NSArray *)ScoreArrM {
    _ScoreArrM = ScoreArrM;
    
    if (ScoreArrM.count == 1) {
        
        NSInteger Score = [[ScoreArrM firstObject] integerValue];
        
        CGFloat H = kWidthScale(169) / 10 * Score;
        
        [_LeftLine mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(H));
            make.width.equalTo(@(kWidthScale(20)));
        }];
        
    }else {
        
        NSInteger Score = [[ScoreArrM firstObject] integerValue];
        NSInteger Score1 = [[ScoreArrM lastObject] integerValue];

        CGFloat H = kWidthScale(169) / 5 * Score;
        CGFloat H1 = kWidthScale(169) / 5 * Score1;
        
        [_LeftLine mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(H));
            make.width.equalTo(@(kWidthScale(10)));
        }];
        
        [_RightLine mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(H1));
            make.width.equalTo(@(kWidthScale(10)));
        }];
    }
}




- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.isGradient) {
        
        CGFloat w = self.frame.size.width;
        CGFloat h = self.LeftLine.frame.size.height;
        self.gradientLayer.frame = CGRectMake(0, 0, w, h);
    }else {
        
        self.gradientLayer.frame = CGRectZero;
    }
    
}


- (void)showBg {
    
    _Bg.hidden = NO;
    
    UIWindow * window=[[[UIApplication sharedApplication] delegate] window];

    CGRect rect=[_LeftLine convertRect:_LeftLine.bounds toView:window];

    NSArray *array = self.ScoreArrM.count == 1 ? @[@""] : @[@"",@""];
    
    ZYHistogramDetailAlert *alert = [[ZYHistogramDetailAlert alloc] initWithArray:array LocationRect:rect];
    [alert show];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _Bg.hidden = YES;
        [alert hide];
    });
    
    
}


@end
