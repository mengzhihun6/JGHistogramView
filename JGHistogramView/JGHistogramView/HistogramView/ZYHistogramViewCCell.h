//
//  ZYHistogramViewCCell.h
//  WSCollege
//
//  Created by spring on 2020/5/26.
//  Copyright © 2020 JG. All rights reserved.
//

#import "ZYBaseCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZYHistogramViewCCell : ZYBaseCollectionViewCell

//柱状图是否需要渐变
@property (nonatomic, assign) BOOL isGradient;
//颜色数组
@property (nonatomic, strong) NSArray *ColorsArrM;
//分数 ---> 根据数据改成模型
@property (nonatomic, strong) NSArray *ScoreArrM;

//弹窗背景色
@property (nonatomic, strong) UIColor *ShowBgColor;

- (void)showBg;

@end

NS_ASSUME_NONNULL_END
