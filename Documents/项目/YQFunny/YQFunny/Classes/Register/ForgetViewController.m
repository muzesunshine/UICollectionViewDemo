//
//  ForgetViewController.m
//  YQFunny
//
//  Created by power on 15-4-29.
//  Copyright (c) 2015年 博文卡特. All rights reserved.
//

#import "ForgetViewController.h"
#import "ForgetResultViewController.h"
@interface ForgetViewController ()

@end

@implementation ForgetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"忘记密码";
}
- (IBAction)submitButtonPress:(id)sender {
    ForgetResultViewController *forget = [[ForgetResultViewController alloc]init];
    [self.navigationController pushViewController:forget animated:YES];
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
