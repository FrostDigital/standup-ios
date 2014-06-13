//
//  FDStandupTableViewController.h
//  Standup-iOS
//
//  Created by Josefin Andersson on 2014-06-13.
//  Copyright (c) 2014 FrostDigital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FDMyTodoTableViewCell.h"

@class FDUser;

@interface FDStandupTableViewController : UITableViewController <FDMyTodoTableViewCellCheckButtonDelegate>

@property (nonatomic) BOOL isMyStandup;
@property (nonatomic) NSDate *date;
@property (nonatomic) FDUser *user;

@end
