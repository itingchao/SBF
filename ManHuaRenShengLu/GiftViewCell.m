//
//  GiftViewCell.m
//  ManHuaRenShengLu
//
//  Created by ms on 15/12/25.
//  Copyright © 2015年 LiuYunchao. All rights reserved.
//

#import "GiftViewCell.h"
#import <UIImageView+WebCache.h>
@implementation GiftViewCell

- (void)awakeFromNib {
    self.myView.layer.masksToBounds=YES;
    self.myView.layer.cornerRadius=5;
    self.thumbnailImage.layer.masksToBounds = YES;
    self.thumbnailImage.layer.cornerRadius = 8;
    self.selectionStyle=UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)showDataWithModel:(dataModel *)model jumpBlock:(JumpBlock)block{
    self.myBlock = block;
    self.model = model;
    [self.thumbnailImage sd_setImageWithURL:[NSURL URLWithString:model.thumbnail_url] placeholderImage:[UIImage imageNamed:@"ic_comic_placeholder"]];
    self.descriptionLabel.text = model.description;
}
@end
