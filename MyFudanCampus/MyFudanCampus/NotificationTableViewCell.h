//
//  NotificationTableViewCell.h
//  MyFudanCampus
//
//  Created by alex on 2017/11/12.
//  Copyright © 2017年 AlexLLL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *hourLabel;

@end
