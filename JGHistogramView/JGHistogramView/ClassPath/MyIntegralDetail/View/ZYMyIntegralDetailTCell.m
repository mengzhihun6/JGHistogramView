//
//  ZYMyIntegralDetailTCell.m
//  WSCollege
//
//  Created by spring on 2020/6/9.
//  Copyright © 2020 JG. All rights reserved.
//

#import "ZYMyIntegralDetailTCell.h"

@interface ZYMyIntegralDetailTCell ()

@property (nonatomic, strong) UILabel *TimeLbl;

@property (nonatomic, strong) UILabel *TitleLbl;

@property (nonatomic, strong) UILabel *ScoreLbl;

@end


@implementation ZYMyIntegralDetailTCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)configUI {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor whiteColor];

    UIView *Line = [UIView new];
    Line.backgroundColor = JGHexColor(@"#E6E6E6");
    
    UIView *RoundV = [UIView new];
    RoundV.clipsToBounds = YES;
    RoundV.layer.cornerRadius = kWidthScale(3.5);
    RoundV.backgroundColor = JGHexColor(@"#E6E6E6");
    
    
    _TimeLbl = [UILabel new];
    _TimeLbl.textColor = JGHexColor(@"#BEBEBE");
    _TimeLbl.font = JGFont(kWidthScale(12));
    _TimeLbl.text = @"12:32";
    
    _TitleLbl = [UILabel new];
    _TitleLbl.textColor = JGHexColor(@"#484848");
    _TitleLbl.font = JGFont(kWidthScale(12));
    _TitleLbl.text = @"登录";
    
    
    _ScoreLbl = [UILabel new];
    NSString *title = @"+1 分";
    NSRange range = [title rangeOfString:@"分"];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:title attributes:@{NSFontAttributeName: JGFontMedium_size(kWidthScale(15)),NSForegroundColorAttributeName: JGHexColor(@"#FF6D00")}];
    [string addAttributes:@{NSFontAttributeName: JGFont(kWidthScale(12))} range:range];
    _ScoreLbl.attributedText = string;
    
    
    [self addSubview:Line];
    [self addSubview:RoundV];
    [self addSubview:_TimeLbl];
    [self addSubview:_TitleLbl];
    [self addSubview:_ScoreLbl];

    
    [Line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self.mas_left).mas_offset(18);
        make.width.equalTo(@(1));
    }];
    
    [RoundV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).mas_offset(kWidthScale(8));
        make.centerX.equalTo(Line.mas_centerX);
        make.width.height.equalTo(@(kWidthScale(7)));
    }];
    
    [_TimeLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(RoundV.mas_right).mas_offset(7);
        make.centerY.equalTo(RoundV.mas_centerY);
    }];
    
    [_TitleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_TimeLbl.mas_left);
        make.top.equalTo(_TimeLbl.mas_bottom).mas_offset(kWidthScale(5));
    }];
 
    [_ScoreLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).mas_offset(-15);
        make.centerY.equalTo(_TitleLbl.mas_centerY);
    }];
    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
