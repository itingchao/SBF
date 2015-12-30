//
//  TabBarViewController.m
//  ManHuaRenShengLu
//
//  Created by ms on 15/12/23.
//  Copyright © 2015年 LiuYunchao. All rights reserved.
//

#import "TabBarViewController.h"
#import "BaseViewController.h"
@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createViewControllers];
}


- (void)createViewControllers{
    NSArray *vcNames = @[@"GiftViewController", @"CartoonViewController", @"MengPicViewController", @"HilariousViewController"];
    NSArray *image = @[@[@"youth_selected@2x", @"youth@2x"],@[@"animation_selected@2x", @"animation@2x"],@[@"fun_selected@2x", @"fun@2x"], @[@"life_selected@2x", @"life@2x"]];
    NSArray *titles = @[@"动图", @"漫画", @"萌图", @"爆笑"];
    NSMutableArray *vcArr = [[NSMutableArray alloc]init];
    for (int i = 0; i<image.count; i++) {
        Class class = NSClassFromString(vcNames[i]);
        BaseViewController *baseVC = [[class alloc]init];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:baseVC];
        baseVC.title = titles[i];
        
        nav.tabBarItem.image = [[UIImage imageNamed:image[i][1]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        nav.tabBarItem.selectedImage = [[UIImage imageNamed:image[i][0]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [vcArr addObject:nav];
    }
    self.viewControllers = vcArr;
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
