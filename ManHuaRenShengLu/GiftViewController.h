//
//  GiftViewController.h
//  ManHuaRenShengLu
//
//  Created by ms on 15/12/23.
//  Copyright © 2015年 LiuYunchao. All rights reserved.
//

#import "BaseViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "GiftViewCell.h"
#import "GiftModel.h"
#import <UIImageView+WebCache.h>
@interface GiftViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView*scrollView;
@property(nonatomic,strong)UIPageControl *pageControl;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArr;
@property (nonatomic,strong) NSMutableArray *dataArr1;
@property (nonatomic) BOOL isRefreshing;
@property (nonatomic) BOOL isLoadMore;
@property (nonatomic) NSInteger currentPage;
@property (nonatomic,strong) AFHTTPRequestOperationManager *manager;

@property (nonatomic,strong) NSString *behot_time;
//创建刷新视图
//- (void)createRefreshView;
////结束刷新
//- (void)endRefreshing;


@end
