//
//  MyCustomLayoutCollection_2VC.m
//  UICollectionViewDemo
//
//  Created by YaoJiaQi on 2017/7/11.
//  Copyright © 2017年 EVYOU. All rights reserved.
//

#import "MyCustomLayoutCollection_2VC.h"
#import "MyCollectionViewCell.h"
#import "My_2Layout.h"

@interface MyCustomLayoutCollection_2VC ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSArray *_imagesArray;
}

@end

@implementation MyCustomLayoutCollection_2VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    /**
     生成数据源
     */
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < 100; i ++) {
        int temp = i%7;
        NSString *imageName = [NSString stringWithFormat:@"image%d.jpg",temp];
        [arr addObject:imageName];
    }
    
    _imagesArray = [NSArray arrayWithArray:arr];
    My_2Layout *layout = [[My_2Layout alloc]init];
    UICollectionView* collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, 300) collectionViewLayout:layout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.center = self.view.center;
    collectionView.backgroundColor = [UIColor cyanColor];
    [collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"MyCollectionViewCell"];
    [self.view addSubview:collectionView];
}
#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource
/**
 每个分区item的个数
 */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _imagesArray.count;
}
/**
 创建cell
 */
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndentifer = @"MyCollectionViewCell";
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIndentifer forIndexPath:indexPath];
    cell.imageStr = _imagesArray[indexPath.item];
    return cell;
}
/**
 点击某个cell
 */
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了第%ld分item",(long)indexPath.item);
}


@end
