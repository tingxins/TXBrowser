//
//  TXTabBarController.m
//  TXBrowserDemo
//
//  Created by tingxins on 4/20/16.
//  Copyright © 2016 TINGXINS All rights reserved.
//

#import "TXTabBarController.h"

#import "TXPlayViewController.h"
#import "TXSettingViewController.h"

@interface TXTabBarController ()

@end

@implementation TXTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /** 1.浏览界面：如新闻、微博等 **/
    [self addChildViewController:[TXPlayViewController class] title:@"浏览" normalImage:@"" selectedImage:@""];
    /** 2.更多界面：一般在App中都有的设置界面 **/
    [self addChildViewController:[TXSettingViewController class] title:@"更多" normalImage:@"" selectedImage:@""];
}

- (void)addChildViewController:(Class )classType title:(NSString *)title normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage {
    UIViewController *childViewController = [[classType alloc] init];
    childViewController.title = title;
    childViewController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    childViewController.tabBarItem.image = [UIImage imageNamed:normalImage];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:childViewController];
    [self addChildViewController:navigationController];
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
