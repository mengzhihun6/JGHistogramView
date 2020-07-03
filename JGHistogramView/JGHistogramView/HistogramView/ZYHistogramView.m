//
//  ZYHistogramView.m
//  WSCollege
//
//  Created by spring on 2020/5/26.
//  Copyright © 2020 JG. All rights reserved.
//

#import "ZYHistogramView.h"
#import "ZYHistogramYValueDottedLine.h"
#import "ZYHistogramViewCCell.h"



@interface ZYHistogramView ()<UICollectionViewDelegate, UICollectionViewDataSource>
//Y轴值+虚线
@property (nonatomic, strong) ZYHistogramYValueDottedLine *YValueDotLine;
//Y轴线
@property (nonatomic, strong) UIView *YAxisLine;
//Y轴单位
@property (nonatomic, strong) UILabel *YAxisUnitLbl;

//X轴线
@property (nonatomic, strong) UIView *XAxisLine;
//X轴单位
@property (nonatomic, strong) UILabel *XAxisUnitLbl;
//X轴标题
@property (nonatomic, strong) UIView *XAxisTitleView;

//柱状图📊
@property (nonatomic, strong) UICollectionView *HistogramView;

@end

static NSString * const ZYHistogramViewCCellId = @"ZYHistogramViewCCellId";

@implementation ZYHistogramView

- (ZYHistogramYValueDottedLine *)YValueDotLine {
    if (!_YValueDotLine) {
        _YValueDotLine = [ZYHistogramYValueDottedLine new];
    }
    return _YValueDotLine;
}

- (UICollectionView *)HistogramView {
    if (!_HistogramView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _HistogramView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _HistogramView.backgroundColor = [UIColor clearColor];
        _HistogramView.delegate = self;
        _HistogramView.dataSource = self;
        _HistogramView.showsVerticalScrollIndicator = NO;
        _HistogramView.showsHorizontalScrollIndicator = NO;
        
        [_HistogramView registerClass:[ZYHistogramViewCCell class] forCellWithReuseIdentifier:ZYHistogramViewCCellId];
    }
    return _HistogramView;
}


- (void)configUI {
    
    self.backgroundColor = [UIColor whiteColor];
    
    _YAxisLine = [UIView new];
    _YAxisLine.backgroundColor = JGHexColor(@"#CDC5C5");
    
    _YAxisUnitLbl = [UILabel new];
    _YAxisUnitLbl.textColor = JGHexColor(@"#6B6868");
    _YAxisUnitLbl.font = JGFont(kWidthScale(12));
    _YAxisUnitLbl.text = @"积分";
    
    
    _XAxisLine = [UIView new];
    _XAxisLine.backgroundColor = JGHexColor(@"#CDC5C5");
    
    _XAxisUnitLbl = [UILabel new];
    _XAxisUnitLbl.textColor = JGHexColor(@"#6B6868");
    _XAxisUnitLbl.font = JGFont(kWidthScale(12));
    _XAxisUnitLbl.text = @"日期";
    
    _XAxisTitleView = [UIView new];
//    _XAxisTitleView.backgroundColor = [UIColor greenColor];
    
    UIView *Line = [UIView new];
    Line.backgroundColor = JGHexColor(@"#E6E6E6");
    
    [self addSubview:self.YValueDotLine];
    [self addSubview:_YAxisLine];
    [self addSubview:_YAxisUnitLbl];
    [self addSubview:_XAxisLine];
    [self addSubview:_XAxisUnitLbl];
    [self addSubview:self.HistogramView];
    [self addSubview:_XAxisTitleView];
    [self addSubview:Line];

    
    [_YValueDotLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_HistogramView).mas_equalTo(UIEdgeInsetsMake(-kWidthScale(5), -kWidthScale(18), -kWidthScale(5), 0));
    }];
    
    [_YAxisLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).mas_offset(-kWidthScale(42));
        make.left.equalTo(self.mas_left).mas_offset(kWidthScale(39));
        make.size.mas_equalTo(CGSizeMake(1, kWidthScale(180)));
    }];
    
    [_YAxisUnitLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_YAxisLine.mas_centerX);
        make.bottom.equalTo(_YAxisLine.mas_top).mas_offset(-kWidthScale(6));
    }];
    
    [_XAxisLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_YAxisLine.mas_bottom);
        make.left.equalTo(_YAxisLine.mas_left);
        make.size.mas_equalTo(CGSizeMake(kWidthScale(288), 1));
    }];
    
    [_XAxisUnitLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_XAxisLine.mas_centerY);
        make.left.equalTo(_XAxisLine.mas_right).mas_offset(kWidthScale(10));
    }];
    
    [_HistogramView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_YAxisLine.mas_right);
        make.bottom.equalTo(_XAxisLine.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(kWidthScale(288), kWidthScale(170)));
    }];

    [_XAxisTitleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(_HistogramView.mas_bottom);
        make.height.equalTo(@(kWidthScale(41)));
        make.width.mas_greaterThanOrEqualTo(100);
    }];
    
    [Line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self);
        make.height.equalTo(@(1));
    }];
}

- (void)setIsHiddenYAxis:(BOOL)isHiddenYAxis {
    _isHiddenYAxis = isHiddenYAxis;
    
    _YAxisLine.hidden = isHiddenYAxis;
    _YAxisUnitLbl.hidden = isHiddenYAxis;    
}

- (void)setYAxisArrM:(NSArray *)YAxisArrM {
    _YAxisArrM = YAxisArrM;
    
    _YValueDotLine.YAxisArrM = YAxisArrM;
}

- (void)setXTitlesArrM:(NSArray *)XTitlesArrM {
    _XTitlesArrM = XTitlesArrM;
    

    if (XTitlesArrM.count == 1) {
        
        UILabel *lbl = [UILabel new];
        lbl.textColor = [self.ColorsArrM firstObject];
        lbl.font = JGFont(kWidthScale(14));
        lbl.text = [XTitlesArrM firstObject];
        lbl.textAlignment = NSTextAlignmentCenter;
        
        [_XAxisTitleView addSubview:lbl];

//        [_XAxisTitleView setupAutoWidthFlowItems:@[lbl] withPerRowItemsCount:1 verticalMargin:0 horizontalMargin:0 verticalEdgeInset:0 horizontalEdgeInset:0];
        
        [lbl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.centerX.equalTo(_XAxisTitleView);
        }];
    }else {
        
        UIButton *LeftBtn = [UIButton new];
        LeftBtn.userInteractionEnabled = NO;
        LeftBtn.titleLabel.font = JGFont(kWidthScale(14));
        [LeftBtn setTitleColor:[self.ColorsArrM firstObject] forState:UIControlStateNormal];
        [LeftBtn setTitle:[XTitlesArrM firstObject] forState:UIControlStateNormal];
        [LeftBtn setImage:[UIImage imageWithColor:[self.ColorsArrM firstObject]] forState:UIControlStateNormal];
        [LeftBtn layoutWithStatus:JGLayoutStatusNormal andMargin:5];

        UIButton *RightBtn = [UIButton new];
        RightBtn.userInteractionEnabled = NO;
        RightBtn.titleLabel.font = JGFont(kWidthScale(14));
        [RightBtn setTitleColor:[self.ColorsArrM lastObject] forState:UIControlStateNormal];
        [RightBtn setTitle:[XTitlesArrM lastObject] forState:UIControlStateNormal];
        [RightBtn setImage:[UIImage imageWithColor:[self.ColorsArrM lastObject]] forState:UIControlStateNormal];
        [RightBtn layoutWithStatus:JGLayoutStatusNormal andMargin:5];
        
        
        [_XAxisTitleView addSubview:LeftBtn];
        [_XAxisTitleView addSubview:RightBtn];

        
        [LeftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_XAxisTitleView.mas_centerX).mas_offset(-10);
            make.size.mas_equalTo(CGSizeMake(kWidthScale(50), kWidthScale(40)));
        }];
        
        [LeftBtn.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(kWidthScale(9), kWidthScale(9)));
            make.centerY.equalTo(_XAxisTitleView.mas_centerY);
        }];
        
        [RightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_XAxisTitleView.mas_centerX).mas_offset(10);
            make.size.mas_equalTo(CGSizeMake(kWidthScale(50), kWidthScale(40)));
        }];
        
        [RightBtn.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(kWidthScale(9), kWidthScale(9)));
            make.centerY.equalTo(_XAxisTitleView.mas_centerY);
        }];
    }
    
    
    
}



#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.ScoreArrM.count;
}

//指定有多少个子视图
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 1;
}

// 显示表头的数据
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

//指定子视图
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ZYHistogramViewCCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ZYHistogramViewCCellId forIndexPath:indexPath];
    cell.ShowBgColor = self.ShowBgColor;
    cell.isGradient = self.isGradient;
    cell.ColorsArrM = self.ColorsArrM;
    
    cell.ScoreArrM = [self.ScoreArrM objectAtIndex:indexPath.section];
    
    
    return cell;
}



#pragma mark - 详情 -
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ZYHistogramViewCCell *Cell = (ZYHistogramViewCCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    
    [Cell showBg];
    
    //    [collectionView reloadData];
    
}



// 表头尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeZero;
}

// 表尾尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeZero;
}

//返回每个子视图的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(kWidthScale(20), kWidthScale(169));
}

//设置每个子视图的缩进
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    //UIEdgeInsets insets = {top, left, bottom, right};
    if (section == 0) return UIEdgeInsetsMake(0, 10, 0, 0);
    return UIEdgeInsetsMake(0, kWidthScale(21.5), 0, 0);
}

//设置子视图上下之间的距离
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0.0;
}

//设置子视图左右之间的距离
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return  0.0;
}

//- (JJCollectionViewRoundConfigModel *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout configModelForSectionAtIndex:(NSInteger)section{
//    JJCollectionViewRoundConfigModel *model = [[JJCollectionViewRoundConfigModel alloc] init];
//    model.backgroundColor = (section == 3) ? JGHexColor(@"#E6E6E6") : [UIColor whiteColor];
//    return model;
//}



/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
