//
//  UIView+Common.h
//  LXAllFree
//
//  Created by ms on 15/12/19.
//  Copyright © 2015年 LiuYunchao. All rights reserved.
//

#import <UIKit/UIKit.h>

//


@interface UIView (Postion)

CGFloat screenWidth();
CGFloat screenHeight();

- (CGFloat)width;
- (CGFloat)height;

CGFloat height(CGRect rect);
CGFloat width(CGRect rect);


CGFloat maxX(UIView *view);
CGFloat maxY(UIView *view);
CGFloat midX(UIView *view);
CGFloat midY(UIView *view);
CGFloat minX(UIView *view);
CGFloat minY(UIView *view);

@end

@interface UIView (Common)

@end
