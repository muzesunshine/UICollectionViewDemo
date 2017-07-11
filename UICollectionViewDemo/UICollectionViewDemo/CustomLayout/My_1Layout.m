//
//  My_1Layout.m
//  UICollectionViewDemo
//
//  Created by YaoJiaQi on 2017/7/10.
//  Copyright © 2017年 EVYOU. All rights reserved.
//

#import "My_1Layout.h"

@interface My_1Layout()
{
    UIEdgeInsets _edgeInset;//内边距
    CGFloat _lineSpacing;//行间距
    CGFloat _columnsSpacing;//列间距
    NSInteger _columnsNum;//列数
    NSMutableArray *_columnsHeightArray;//用来存放所有列的高度
    CGFloat _maxHeight;//collectionContent最大高度
}
@property (nonatomic,strong) NSMutableArray *attributesArray;//用来存放所有的cell的布局


@end

@implementation My_1Layout

- (instancetype)init{
    if ([super init]) {
        _columnsHeightArray = [NSMutableArray new];
        _columnsHeightArray = [NSMutableArray arrayWithCapacity:_columnsNum];
        }
    return self;
}
/**
 *prepareLayout会频繁调用，所以只做一些简单的初始化操作
 */
- (void)prepareLayout{

     //切记，一定要先调用父类的prepareLayout
    [super prepareLayout];
    _edgeInset = UIEdgeInsetsMake(5, 10, 5, 10);
    _lineSpacing = 10;
    _columnsSpacing = 10;
    _columnsNum = 3;
    _maxHeight = _edgeInset.top;
    [_columnsHeightArray removeAllObjects];
    for (int i = 0; i < _columnsNum ; i ++) {
        [_columnsHeightArray addObject:[NSNumber numberWithInteger:_edgeInset.top]];
    }
    
    [self.attributesArray removeAllObjects];
    /**
     调用layoutAttributesForItemAtIndexPath：方法，根据collectionView中cell的个数，使用for循环，创建对应个数的cell的attributes，并存放到_columnsHeightArray数组中（也可以将该过程放到layoutAttributesForElementsInRect：中去执行）
     */
    NSInteger cellNum = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i < cellNum; i ++) {
        NSIndexPath*indexPath=[NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attri = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attributesArray addObject:attri];
    }
}
/**
 *设置为YES,collectionView的显示范围发生变化时，就要刷新布局
 */
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    
    return YES;
}
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    /**
     直接返回之前存放好的所有cell的attributes（也可以将prepareLayout方法中for循环创建attributes的过程放到这里执行）
     */
    return self.attributesArray;
}
-(UICollectionViewLayoutAttributes*)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes*attributes=[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    CGFloat cellW = (kScreenWidth-_edgeInset.left-_edgeInset.right-(_columnsNum-1)*_columnsSpacing)/_columnsNum;
    CGFloat cellH = indexPath.item%10==0?200:(indexPath.item%2==0?125:160);
    // 应该添加cell的列号
    NSInteger minHeightColumn = 0;
    // 应该添加cell的列的高度
    CGFloat minColumnHeight = [_columnsHeightArray[minHeightColumn] doubleValue];
    //循环  获取最小的列的高度和该列的列号
    for (int i = 1; i < _columnsHeightArray.count; i ++ ) {
        CGFloat tempH = [_columnsHeightArray[i] floatValue];
        if (minColumnHeight > tempH) {
            minColumnHeight = tempH;
            minHeightColumn = i;
        }
    }
    //为高度最小的列添加cell
    CGFloat cellY = [_columnsHeightArray[minHeightColumn] floatValue]+_lineSpacing;
    CGFloat cellX = _edgeInset.left + minHeightColumn * (cellW + _columnsSpacing);
    attributes.frame = CGRectMake(cellX, cellY, cellW, cellH);
    //保存最新的高度
    CGFloat newHeight = cellY+cellH;
    [_columnsHeightArray replaceObjectAtIndex:minHeightColumn withObject:[NSNumber numberWithInteger:newHeight]];
    //返回布局信息
    return attributes;
}
- (CGSize)collectionViewContentSize{
    //根据最高的列 设置collectionContentSize
    [_columnsHeightArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat maxHeight = [_columnsHeightArray[idx]floatValue];
        if (maxHeight > _maxHeight) {
            _maxHeight = maxHeight;
        }
    }];
    return CGSizeMake(kScreenWidth, _maxHeight);
}
- (NSMutableArray *)attributesArray{
    if (!_attributesArray) {
        _attributesArray = [NSMutableArray new];
    }
    return _attributesArray;
}

@end
