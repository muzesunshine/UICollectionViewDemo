//
//  RegisterListViewController.m
//  YQFunny
//
//  Created by power on 15-4-29.
//  Copyright (c) 2015年 博文卡特. All rights reserved.
//

#import "RegisterListViewController.h"
#import "RegisterListTwoViewController.h"
@interface RegisterListViewController ()

@end

@implementation RegisterListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)nextButtonPress:(id)sender {
    RegisterListTwoViewController *two = [[RegisterListTwoViewController alloc]init];
    [self.navigationController pushViewController:two animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
