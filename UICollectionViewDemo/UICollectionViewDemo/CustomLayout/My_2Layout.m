//
//  My_2Layout.m
//  UICollectionViewDemo
//
//  Created by YaoJiaQi on 2017/7/10.
//  Copyright © 2017年 EVYOU. All rights reserved.
//

#import "My_2Layout.h"

@implementation My_2Layout
/**
 *prepareLayout会频繁调用，所以只做一些简单的初始化操作
 */
- (void)prepareLayout{
    [super prepareLayout];
    // 水平滚动
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //设置cell大小（可放到外面的控制器中）
    self.itemSize = CGSizeMake(200, 200);
    //设置内边距
    CGFloat inset = (self.collectionView.frame.size.width - self.itemSize.width) * 0.5;
    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);
    
}
/**
 *设置为YES,collectionView的显示范围发生变化时，就要刷新布局
 */
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    
    return YES;
}
/**
 *返回所有cell的布局属性
 */
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    //获取UICollectionViweFlowLayout已经做好的布局
    NSArray *attrbutesArray = [super layoutAttributesForElementsInRect:rect];
    //计算collectionView可视范围的中心点所对应的collectionView的x值
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width * 0.5;
    //以每个cell中心点到centerX的距离为参考，对cell进行缩放
    for (UICollectionViewLayoutAttributes *attributes in attrbutesArray) {
        //cell的中心点到centerX的距离
        CGFloat distance = ABS(attributes.center.x - centerX);
        //根据distance计算cell的缩放比例
        CGFloat scale = 1 - (distance / self.collectionView.frame.size.width);
        //设置缩放比例
        attributes.transform3D = CATransform3DMakeScale(scale, scale, scale);
    }
    // 返回调整之后的布局属性数组
    return attrbutesArray;
}
/**
 * 在重新刷新布局时调用
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    return attr;
}
/**
 * collectionView停止滑动时调用，可以手动设置collectionView的偏移量
 * proposedContentOffset collectionView原本的偏移量
 */
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    //计算出最终显示的矩形框
    CGRect endRect;
    endRect.origin.x = proposedContentOffset.x;
    endRect.origin.y = 0;
    endRect.size = CGSizeMake(self.collectionView.frame.size.width, self.collectionView.frame.size.height);
    
    //获得所有cell的布局属性
    NSArray *attributesArr = [super layoutAttributesForElementsInRect:endRect];
    
    //计算collectionView最中心点的x值
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;
    //循环所有的布局属性，得到距离中心点最近的cell到中心点的距离
    CGFloat minDelta = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attr in attributesArr) {
        if(ABS(minDelta) > ABS(attr.center.x - centerX)) {
            minDelta = attr.center.x - centerX;
        }
    }
    //原来偏移量的x+距离中心点最近的cell到中心点的距离 将其设置为偏移量,该cell就会到中心点
    proposedContentOffset.x += minDelta;
    return proposedContentOffset;
}
@end
