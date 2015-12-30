//
//  GiftViewCell.h
//  ManHuaRenShengLu
//
//  Created by ms on 15/12/25.
//  Copyright © 2015年 LiuYunchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GiftModel.h"
typedef void (^JumpBlock)(void);
@interface GiftViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *myView;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImage;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (nonatomic, strong) dataModel *model;
@property (nonatomic, copy) JumpBlock myBlock;
- (void)showDataWithModel:(dataModel *)model jumpBlock:(JumpBlock)block;
@end
