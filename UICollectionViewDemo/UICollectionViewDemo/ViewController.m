//
//  ViewController.m
//  UICollectionViewDemo
//
//  Created by YaoJiaQi on 2017/7/8.
//  Copyright © 2017年 EVYOU. All rights reserved.
//

#import "ViewController.h"
#import "MyOrdinaryCollection_1VC.h"
#import "MyOrdinaryCollection_2VC.h"
#import "MyCustomLayoutCollection_1VC.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_listArray;
    NSArray *_vcArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _listArray = @[@"基本使用(基于layout做配置)",@"基本使用(基于代理方法做配置)",@"自定义UICollectionViewLayout",@"自定义UICollectionViewFlowLayout"];
    _vcArray = @[@"MyOrdinaryCollection_1VC",@"MyOrdinaryCollection_2VC",@"MyCustomLayoutCollection_1VC",@"MyCustomLayoutCollection_2VC"];
    
    UITableView *tableview = [[UITableView alloc]initWithFrame:self.view.bounds];
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];
}
#pragma mark - UITableViewDelegate , UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _listArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndentifer = @"listCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifer];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifer];
    }
    cell.textLabel.text = _listArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *vc = [[NSClassFromString(_vcArray[indexPath.row]) alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
