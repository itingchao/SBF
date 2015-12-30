//
//  GiftViewController.m
//  ManHuaRenShengLu
//
//  Created by ms on 15/12/23.
//  Copyright © 2015年 LiuYunchao. All rights reserved.
//

#import "GiftViewController.h"
#import <UIImageView+WebCache.h>
#import "DetailViewController.h"
#import "GiftModel.h"
#import "GiftViewCell.h"
#import <AFNetworking/AFNetworking.h>
#import <MJRefresh/MJRefresh.h>
@interface GiftViewController ()
@end

@implementation GiftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArr = [NSMutableArray array];
    _dataArr1 = [NSMutableArray array];
    _currentPage = 1;
    [self initWithRequestManager];
    [self loadData];
    [self createTableView];
    [self loadData];
    //[self createScrollView:_dataArr1];
    
}

- (void)initWithRequestManager {
    if (_manager == nil) {
        _manager = [AFHTTPRequestOperationManager manager];
        _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
}





//- (void)loadData1{
//    __weak typeof(self) weakSelf = self;
//
//    NSString *url = [NSString stringWithFormat:DGUrl, self.behot_time];
//    
//        if (weakSelf.currentPage == 1) {
//        [weakSelf.dataArr1 removeAllObjects];
//    }
//    NSString *str = [NSString stringWithContentsOfURL:[NSURL URLWithString:url] encoding:NSUTF8StringEncoding error:nil];
//    NSData *responseObject = [str dataUsingEncoding:NSUTF8StringEncoding];
//    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//    NSArray *itemArr = dict[@"data"];
//    for (NSDictionary *itemDict in itemArr) {
//        [weakSelf.dataArr1 addObject:itemDict[@"middle_url"]];
//    }
//}


- (void)createTableView{
    __weak typeof(self) weakSelf = self;

    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView registerNib:[UINib nibWithNibName:@"GiftViewCell" bundle:nil] forCellReuseIdentifier:@"cellId"];
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        if (weakSelf.isRefreshing) {
            
            return ;
        }
        weakSelf.isRefreshing = YES;
        weakSelf.currentPage = 1;
        weakSelf.behot_time=nil;
        //[weakSelf loadData1];
        [weakSelf loadData];

    }];
    _tableView.mj_header = header;
    
    MJRefreshBackNormalFooter *footer =[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        if (weakSelf.isLoadMore) {
            return ;
        }
        weakSelf.isLoadMore = YES;
        weakSelf.currentPage++;
        dataModel *model = [weakSelf.dataArr lastObject];
        weakSelf.behot_time= model.behot_time;
        [weakSelf loadData];
    }];
    _tableView.mj_footer = footer;
    [_tableView.mj_footer beginRefreshing];
}

- (void)loadData{
    NSString *url = [NSString stringWithFormat:DGUrl, self.behot_time];
    __weak typeof(self)weakSelf = self;
    [_manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (responseObject) {
            if (weakSelf.currentPage == 1) {
                [weakSelf.dataArr removeAllObjects];
                
            }
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSArray *itemArr = dict[@"data"];
            for (NSDictionary *itemDict in itemArr) {
                dataModel *model = [[dataModel alloc]init];
                [model setValuesForKeysWithDictionary:itemDict];
                [weakSelf.dataArr addObject:model];
            }
            [weakSelf.tableView reloadData];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    
    
    
    
    
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cellId";
    GiftViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[GiftViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.model = _dataArr[indexPath.row];
//    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    return cell;
}

- (void)createScrollView:(NSArray *)array{
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, screenWidth(), screenHeight())];
    CGFloat SCROLLVIEWWITH = _scrollView.bounds.size.width;
    CGFloat SCROLLVIEWHEIGHT = _scrollView.bounds.size.height;

    _scrollView.contentSize = CGSizeMake(SCROLLVIEWWITH * 7, 0);
    
    for (NSInteger i = 0; i < 7; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*SCROLLVIEWWITH, 0, SCROLLVIEWWITH, SCROLLVIEWHEIGHT)];
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(i*SCROLLVIEWWITH, 0, SCROLLVIEWWITH, SCROLLVIEWHEIGHT)];
        NSString *path = nil;
        
        if (i!=6&&i!=0) {
            path = array[i-1];
        }else if (i == 6){
            path = array[0];
        }else if (i == 0){
            path = array[4];
        }
        [imageView sd_setImageWithURL:[NSURL URLWithString:path] placeholderImage:[UIImage imageNamed:@"ic_comic_placeholder"]];
        [_scrollView addSubview:imageView];
        
        button.tag = 101 + i - 1;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_scrollView addSubview:button];
    }
    _scrollView.pagingEnabled = YES;//是否能翻页
    _scrollView.bounces = NO;
    _scrollView.contentOffset = CGPointMake(SCROLLVIEWWITH, 0);
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.delegate = self;
    _scrollView.backgroundColor = [UIColor blackColor];
    _tableView.tableHeaderView = _scrollView;
    [self createPageControl];
    
}

- (void)createPageControl{
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, screenHeight()/3 - 30, screenWidth(), 30)];
    _pageControl.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5];
    _pageControl.pageIndicatorTintColor = [UIColor grayColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    [_tableView addSubview:_pageControl];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x == _scrollView.bounds.size.width*6) {
        [_scrollView setContentOffset:CGPointMake(_scrollView.bounds.size.width, 0) animated:NO];
    }
    if (scrollView.contentOffset.x == 0) {
        [_scrollView setContentOffset:CGPointMake(_scrollView.bounds.size.width*5, 0) animated:NO];
    }
    _pageControl.currentPage = _scrollView.contentOffset.x/_scrollView.bounds.size.width - 1;
}
- (void)buttonClick:(UIButton *)button{
    DetailViewController *detail = [[DetailViewController alloc]init];
    [self.navigationController pushViewController:detail animated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
