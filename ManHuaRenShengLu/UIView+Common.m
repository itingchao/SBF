//
//  UIView+Common.m
//  LXAllFree
//
//  Created by ms on 15/12/19.
//  Copyright © 2015年 LiuYunchao. All rights reserved.
//

#import "UIView+Common.h"

@implementation UIView (Postion)
//
CGFloat screenWidth() {
    return [[UIScreen mainScreen]bounds].size.width;
}

CGFloat screenHeight() {
    return [[UIScreen mainScreen]bounds].size.height;
}

/**
 *  返回当前视图的宽
 *
 *  @return 返回当前视图的宽
 */
- (CGFloat)width {
    return self.frame.size.width;
}

/**
 *
 *
 *  @return 返回视图的高
 */
- (CGFloat)height {
    return self.frame.size.height;
}


/**
 *  根据frame返回宽
 *
 *  @param rect 视图的rect
 *
 *  @return 宽
 */
CGFloat width(CGRect rect) {
    return CGRectGetWidth(rect);
}

/**
 *  根据frame返回高
 *
 *  @param rect 视图的rect
 *
 *  @return 高
 */
CGFloat height(CGRect rect) {
    return CGRectGetHeight(rect);
}


/**
 *
 *
 *  @param view
 *
 *  @return
 */

CGFloat maxX(UIView *view) {
    return CGRectGetMaxX(view.frame);
}

CGFloat maxY(UIView *view) {
    return CGRectGetMaxY(view.frame);
}

CGFloat midX(UIView *view) {
    return CGRectGetMidX(view.frame);
}

CGFloat midY(UIView *view) {
    return CGRectGetMidY(view.frame);
}

CGFloat minX(UIView *view) {
    return CGRectGetMinX(view.frame);
}

CGFloat minY(UIView *view) {
    return CGRectGetMinY(view.frame);
}

@end



@implementation UIView (Common)

@end
