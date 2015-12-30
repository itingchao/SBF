//
//  GiftModel.h
//  ManHuaRenShengLu
//
//  Created by ms on 15/12/25.
//  Copyright © 2015年 LiuYunchao. All rights reserved.
//

#import <JSONModel/JSONModel.h>


@protocol dataModel

@end
@interface dataModel : JSONModel

@property (nonatomic, copy) NSString <Optional>*large_height;
@property (nonatomic, copy) NSString <Optional>*user_bury;
@property (nonatomic, copy) NSString <Optional>*user_repin_time;
@property (nonatomic, copy) NSString <Optional>*format;
@property (nonatomic, copy) NSString <Optional>*tag_id;
@property (nonatomic, copy) NSString <Optional>*middle_width;
@property (nonatomic, copy) NSString <Optional>*tag;
@property (nonatomic, copy) NSString <Optional>*share_url;
@property (nonatomic, copy) NSString <Optional>*user_digg;
@property (nonatomic, copy) NSString <Optional>*is_gif;
@property (nonatomic, copy) NSString <Optional>*desc;
@property (nonatomic, copy) NSString <Optional>*large_url;
@property (nonatomic, copy) NSString <Optional>*bury_count;
@property (nonatomic, copy) NSString <Optional>*repin_count;
@property (nonatomic, copy) NSString <Optional>*level;
@property (nonatomic, copy) NSString <Optional>*digg_count;
@property (nonatomic, copy) NSString <Optional>*behot_time;
@property (nonatomic, copy) NSString <Optional>*middle_url;
@property (nonatomic, copy) NSString <Optional>*comment_count;
@property (nonatomic, copy) NSString <Optional>*thumbnail_url;
@property (nonatomic, copy) NSString <Optional>*is_shorten;
@property (nonatomic, copy) NSString <Optional>*user_repin;
@property (nonatomic, copy) NSString <Optional>*middle_height;
@property (nonatomic, copy) NSString <Optional>*group_id;
@property (nonatomic, copy) NSString <Optional>*large_width;

@end

@interface GiftModel : JSONModel
@property (nonatomic, copy) NSString <Optional> *has_more;
@property (nonatomic, copy) NSString <Optional> *message;
@property (nonatomic,strong) NSMutableArray <dataModel> *data;

@end
