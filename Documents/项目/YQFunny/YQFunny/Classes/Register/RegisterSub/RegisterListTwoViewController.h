//
//  RegisterListTwoViewController.h
//  YQFunny
//
//  Created by power on 15-4-29.
//  Copyright (c) 2015年 博文卡特. All rights reserved.
//

#import "PTViewController.h"

@interface RegisterListTwoViewController : PTViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *schoolView;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)selectSchool:(id)sender;

@end
