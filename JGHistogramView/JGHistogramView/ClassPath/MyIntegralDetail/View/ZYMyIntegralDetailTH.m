//
//  ZYMyIntegralDetailTH.m
//  WSCollege
//
//  Created by spring on 2020/6/9.
//  Copyright © 2020 JG. All rights reserved.
//

#import "ZYMyIntegralDetailTH.h"
#import "ZYMyIntegralDetailTHCCell.h"

@interface ZYMyIntegralDetailTH ()<UICollectionViewDelegate, UICollectionViewDataSource>
//柱状图
@property (nonatomic, strong) UICollectionView *HistogramView;

@property (nonatomic, strong) UILabel *TitleLbl;
@property (nonatomic, strong) UILabel *TimeLbl;

@end

static NSString * const ZYMyIntegralDetailTHCCellId = @"ZYMyIntegralDetailTHCCellId";


@implementation ZYMyIntegralDetailTH

- (UICollectionView *)HistogramView {
    if (!_HistogramView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _HistogramView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _HistogramView.backgroundColor = JGHexColor(@"#E5E5E5");
        _HistogramView.delegate = self;
        _HistogramView.dataSource = self;
        _HistogramView.showsVerticalScrollIndicator = NO;
        _HistogramView.showsHorizontalScrollIndicator = NO;
        
        [_HistogramView registerClass:[ZYMyIntegralDetailTHCCell class] forCellWithReuseIdentifier:ZYMyIntegralDetailTHCCellId];
    }
    return _HistogramView;
}


- (void)configUI {
    
    UIView *TopBg = [UIView new];
    TopBg.backgroundColor = JGHexColor(@"#F7F7F7");
    
    
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
    

    [self addSubview:TopBg];
    [self addSubview:self.HistogramView];
    [self addSubview:_TitleLbl];
    [self addSubview:_TimeLbl];

    [TopBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, kWidthScale(36), 0));
    }];
    
    [_HistogramView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.right.equalTo(self);
//        make.height.equalTo(@(kWidthScale(210)));
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 15, kWidthScale(36), 15));
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


#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 20;
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
    
    ZYMyIntegralDetailTHCCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ZYMyIntegralDetailTHCCellId forIndexPath:indexPath];
    cell.Score = arc4random() % 5 + 1;

    return cell;
}



#pragma mark - 详情 -
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ZYMyIntegralDetailTHCCell *Cell = (ZYMyIntegralDetailTHCCell *)[collectionView cellForItemAtIndexPath:indexPath];

    [Cell showBg];
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
    
    return CGSizeMake(kWidthScale(47), kWidthScale(210));
}

//设置每个子视图的缩进
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    //UIEdgeInsets insets = {top, left, bottom, right};
//    if (section == 0) return UIEdgeInsetsMake(0, 15, 0, 0);
    return UIEdgeInsetsMake(0, 1, 0, 0);
}

//设置子视图上下之间的距离
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0.0;
}

//设置子视图左右之间的距离
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return  0.0;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
