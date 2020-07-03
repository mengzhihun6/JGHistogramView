//
//  ZYHistogramDetailAlert.h
//  WSCollege
//
//  Created by spring on 2020/5/30.
//  Copyright © 2020 JG. All rights reserved.
//

#import "ZYBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZYHistogramDetailAlert : ZYBaseView

- (instancetype)initWithArray:(NSArray *)array LocationRect:(CGRect)rect;


-(void)show;

-(void)hide;



@end

NS_ASSUME_NONNULL_END
