//
//  MyCollectionViewCell.m
//  UICollectionViewDemo
//
//  Created by YaoJiaQi on 2017/7/8.
//  Copyright © 2017年 EVYOU. All rights reserved.
//

#import "MyCollectionViewCell.h"

@interface MyCollectionViewCell()

@property (nonatomic,strong) UIImageView *imageView;

@end

@implementation MyCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.layer.masksToBounds = YES;        
        [self addSubview:imageView];
        self.imageView = imageView;
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
}
- (void)setImageStr:(NSString *)imageStr{
    _imageStr = imageStr;
    self.imageView.image = [UIImage imageNamed:_imageStr];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}


@end
