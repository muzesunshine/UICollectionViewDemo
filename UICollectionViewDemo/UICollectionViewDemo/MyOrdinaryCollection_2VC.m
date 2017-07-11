//
//  MyOrdinaryCollection_2VC.m
//  UICollectionViewDemo
//
//  Created by YaoJiaQi on 2017/7/9.
//  Copyright © 2017年 EVYOU. All rights reserved.
//

#import "MyOrdinaryCollection_2VC.h"
#import "MyCollectionViewCell.h"

@interface MyOrdinaryCollection_2VC ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSArray *_imagesArray;
}


@end

@implementation MyOrdinaryCollection_2VC

- (void)viewDidLoad {
    [super viewDidLoad];

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
    
    /**
     创建layout
     */
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    /**
     设置item的行间距和列间距
     */
    layout.minimumInteritemSpacing = kLineSpacing;
    layout.minimumLineSpacing = kLineSpacing;
    /**
     设置item的大小
     */
    CGFloat itemW = (kScreenWidth-(kLineNum+1)*kLineSpacing)/kLineNum-0.001;
    layout.itemSize = CGSizeMake(itemW, itemW);
    /*
     设置每个分区的上左下右的内边距
     */
    layout.sectionInset = UIEdgeInsetsMake(kLineSpacing, kLineSpacing,kLineSpacing, kLineSpacing);
    /**
     设置区头和区尾的大小
     */
    layout.headerReferenceSize = CGSizeMake(kScreenWidth, 65);
    layout.footerReferenceSize = CGSizeMake(kScreenWidth, 65);
    /**
     设置分区的头视图和尾视图是否始终固定在屏幕上边和下边
     */
    layout.sectionFootersPinToVisibleBounds = YES;
    /**
     创建collectionView
     */
    UICollectionView* collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64) collectionViewLayout:layout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor cyanColor];
    [collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"MyCollectionViewCell"];
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MyCollectionViewHeaderView"];
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"MyCollectionViewFooterView"];
    
    [self.view addSubview:collectionView];
}

#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _imagesArray.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndentifer = @"MyCollectionViewCell";
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIndentifer forIndexPath:indexPath];
    cell.backgroundColor = [UIColor cyanColor];
    cell.imageStr = _imagesArray[indexPath.item];
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionHeader){
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"MyCollectionViewHeaderView" forIndexPath:indexPath];
        headerView.backgroundColor = [UIColor yellowColor];
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:headerView.bounds];
        titleLabel.text = [NSString stringWithFormat:@"第%ld个分区的区头",indexPath.section];
        [headerView addSubview:titleLabel];
        return headerView;
    }else if(kind == UICollectionElementKindSectionFooter){
        UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"MyCollectionViewFooterView" forIndexPath:indexPath];
        footerView.backgroundColor = [UIColor blueColor];
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:footerView.bounds];
        titleLabel.text = [NSString stringWithFormat:@"第%ld个分区的区尾",indexPath.section];
        [footerView addSubview:titleLabel];
        return footerView;
    }
    return nil;
    
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了第%ld分item",(long)indexPath.item);
}


@end
