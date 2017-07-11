//
//  RegisterListTwoViewController.m
//  YQFunny
//
//  Created by power on 15-4-29.
//  Copyright (c) 2015年 博文卡特. All rights reserved.
//

#import "RegisterListTwoViewController.h"
#import "SchoolCell.h"
#import "RegisterListThreeViewController.h"
@interface RegisterListTwoViewController ()

@end

@implementation RegisterListTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"注册";
    CGRect schoolView = self.schoolView.frame;
    schoolView.origin.y = PTTotalHeight;
    self.schoolView.frame = schoolView;
    self.schoolView.backgroundColor = [UIColor blackColor];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.schoolView.alpha = 0.8;
}

#pragma mark - tableViewDelegate &datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    SchoolCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[SchoolCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.backgroundColor = [UIColor clearColor];
    if (indexPath.row == 1) {
        [cell.selectImageView setImage:[UIImage imageNamed:@"dijikuang_03"]];
        
    }else
        [cell.selectImageView setImage:[UIImage imageNamed:@"dijikuang_06"]];
    cell.schoolName.text = @"北京清华大学";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - Action
- (IBAction)selectSchool:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect schoolView =  self.schoolView.frame;
        schoolView.origin.y =  self.schoolView.frame.size.height+ios7NavH;
        self.schoolView.frame = schoolView;
    }];
}
- (IBAction)schoolTrue:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect schoolView = self.schoolView.frame;
        schoolView.origin.y = PTTotalHeight;
        self.schoolView.frame = schoolView;
    }];
}
- (IBAction)nextButtonPress:(id)sender {
    RegisterListThreeViewController *regist = [[RegisterListThreeViewController alloc]init];
    [self.navigationController pushViewController:regist animated:YES];
}

- (IBAction)bgButtonPress:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect schoolView = self.schoolView.frame;
        schoolView.origin.y = PTTotalHeight;
        self.schoolView.frame = schoolView;
    }];
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
