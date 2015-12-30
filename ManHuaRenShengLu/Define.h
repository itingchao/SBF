//
//  Define.h
//  EDT
//
//  Created by qianfeng007 on 15/8/7.
//  Copyright (c) 2015年 ZHL. All rights reserved.
//

#ifndef EDT_Define_h
#define EDT_Define_h
#import "MyControl.h"
#import "UIView+Common.h"


#define kScreenSize [UIScreen mainScreen].bounds.size
//语录新鲜接口
#define IWRecentUrl @"http://ic.snssdk.com/2/essay/v3/recent/?&tag=criticism&max_behot_time=%@&iid=2913828581&app_name=criticism_essay"
//语录热门接口
#define IWHotUrl @"http://ic.snssdk.com/2/essay/v3/hot/?&tag=criticism&max_behot_time=%@&iid=2913828581&app_name=criticism_essay"
//语录随机接口
#define IWRandomUrl @"http://ic.snssdk.com/2/essay/v3/random/?&tag=criticism&max_behot_time=%@&iid=2913828581&app_name=criticism_essay"

//图片新鲜接口
#define PWRecentUrl @"http://ic.snssdk.com/2/essay/v3/image/recent/?&max_behot_time=%@&iid=2913828581&app_name=criticism_essay"
//图片热门接口
#define PWHotUrl @"http://ic.snssdk.com/2/essay/v3/image/hot/?max_behot_time=%@&iid=2913828581&app_name=criticism_essay"
//图片随机接口
#define PWRandomUrl @"http://ic.snssdk.com/2/essay/v3/image/random/?max_behot_time=%@&iid=2913828581&app_name=criticism_essay"
//详情页面接口
#define tDetailUrl @"http://ic.snssdk.com/2/essay/v3/recent/?&tag=criticism&max_behot_time=%@&iid=2913828581&app_name=criticism_essay&count=1"



//首页爆笑接口
#define FUrl @"http://ic.snssdk.com/2/image/recent/?tag=heavy&count=20&max_behot_time=%@"
//爆笑每日热门接口
#define FDUrl @"http://ic.snssdk.com/2/image/top/?tag=heavy&days=1&count=300"
//爆笑每周热门接口
#define FWUrl @"http://ic.snssdk.com/2/image/top/?tag=heavy&days=7&count=300"

//1.1  爆笑评论接口
//
//http://isub.snssdk.com/2/data/v4/get_comments/?group_id=5003742101&count=20&offset=0&sort=recent&iid=2915005542&device_id=3359117577&ac=wifi&channel=360&aid=1&app_name=funny_gallery
//
//1.2  爆笑喜欢接口
//POST http://isub.snssdk.com/2/data/item_action/、
//
//{"bury_count": 48, "repin_count": 4, "digg_count": 110, "tag_id": 0, "comment_count": 42, "tag": "heavy", "message": "success", "group_id": 5004637654}

//漫画接口
#define CTUrl @"http://ic.snssdk.com/2/image/recent/?tag=comic&count=20&max_behot_time=%@"
//漫画今日热门接口
#define CTDUrl @"http://ic.snssdk.com/2/image/top/?tag=comic&days=1&count=300"
//漫画本周热门接口
#define CTWUrl @"http://ic.snssdk.com/2/image/top/?tag=comic&days=7&count=300"


//萌图接口
#define MPUrl @"http://ic.snssdk.com/2/image/recent/?tag=meng&count=20&max_behot_time=%@"
//萌图今日热门接口
#define MPDUrl @"http://ic.snssdk.com/2/image/top/?tag=meng&days=1&count=300"
//萌图本周热门接口
#define MPWUrl @"http://ic.snssdk.com/2/image/top/?tag=meng&days=7&count=300"


//动图接口
#define DGUrl @"http://ic.snssdk.com/2/image/recent/?tag=gif&count=20&max_behot_time=%@"
//动图今日热门接口
#define DGDUrl @"http://ic.snssdk.com/2/image/recent/?tag=gif&days=1&count=20"
//动图本周热门接口
#define DGWUrl @"http://ic.snssdk.com/2/image/recent/?tag=gif&days=7&count=20"


#endif
