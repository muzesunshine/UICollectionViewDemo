//
//  SchoolCell.m
//  YQFunny
//
//  Created by power on 15-4-29.
//  Copyright (c) 2015年 博文卡特. All rights reserved.
//

#import "SchoolCell.h"

@implementation SchoolCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 15, 15, 15)];
        [self.contentView addSubview:self.selectImageView];
        self.schoolName = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.selectImageView.frame)+30, 10, 200, 30)];
        self.schoolName.textColor = [UIColor whiteColor];
        self.schoolName.font = [UIFont systemFontOfSize:smallFont];
        [self.contentView addSubview:self.schoolName];
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
