//
//  MyCustomLayoutCollection_1VC.m
//  UICollectionViewDemo
//
//  Created by YaoJiaQi on 2017/7/10.
//  Copyright © 2017年 EVYOU. All rights reserved.
//

#import "MyCustomLayoutCollection_1VC.h"
#import "My_1Layout.h"
#import "MyCollectionViewCell.h"
@interface MyCustomLayoutCollection_1VC ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSArray *_imagesArray;
}

@end

@implementation MyCustomLayoutCollection_1VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
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
    My_1Layout *layout = [[My_1Layout alloc]init];
    UICollectionView* collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64) collectionViewLayout:layout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
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
