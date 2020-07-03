//
//  ZYHistogramYValueDottedLine.m
//  WSCollege
//
//  Created by spring on 2020/5/26.
//  Copyright © 2020 JG. All rights reserved.
//

#import "ZYHistogramYValueDottedLine.h"

@interface ZYHistogramYValueDotLine : ZYBaseView

@property (nonatomic, strong) UILabel *TitleLbl;

@property (nonatomic, strong) UIView *Line;

@end


@implementation ZYHistogramYValueDotLine

- (void)configUI {
    
    self.backgroundColor = [UIColor clearColor];
    
    _TitleLbl = [UILabel new];
    _TitleLbl.textColor = JGHexColor(@"#6B6868");
    _TitleLbl.font = JGFontMedium_size(kWidthScale(10));
//    _TitleLbl.text = @"阅读新闻";
    
    _Line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidthScale(288), 1)];
    [_Line addBorderDottedLinewithColor:JGHexColor(@"#CDC5C5")];
    
    
    [self addSubview:_TitleLbl];
    [self addSubview:_Line];

    [_TitleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [_Line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(kWidthScale(288), 1));
    }];
}

@end


@interface ZYHistogramYValueDottedLine ()

@property (nonatomic, strong) NSMutableArray *ViewArrM;

@end


@implementation ZYHistogramYValueDottedLine

- (NSMutableArray *)ViewArrM {
    if (!_ViewArrM) {
        _ViewArrM = [NSMutableArray array];
    }
    return _ViewArrM;
}

- (void)configUI {
    
    self.backgroundColor = [UIColor clearColor];
}


- (void)setYAxisArrM:(NSArray *)YAxisArrM {
    _YAxisArrM = YAxisArrM;
    
    [self.ViewArrM removeAllObjects];
    
    for (UIView *v in self.subviews) {
        if ([v isKindOfClass:[ZYHistogramYValueDotLine class]]) {
            [v removeFromSuperview];
        }
    }
    
    for (NSInteger i = 0; i < YAxisArrM.count; i++) {
        
        ZYHistogramYValueDotLine *YValueDotLine = [ZYHistogramYValueDotLine new];
        YValueDotLine.TitleLbl.text = [YAxisArrM objectAtIndex:YAxisArrM.count - (i+1)];
        [self addSubview:YValueDotLine];
        
        [self.ViewArrM addObject:YValueDotLine];
        
        YValueDotLine.sd_layout.heightIs(kWidthScale(10));
    }
    
    [self setupAutoMarginFlowItems:self.ViewArrM withPerRowItemsCount:1 itemWidth:kWidthScale(305) verticalMargin:kWidthScale(24) verticalEdgeInset:0 horizontalEdgeInset:0];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
