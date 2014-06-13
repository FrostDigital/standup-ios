//
//  FDMyTodoTableViewCell.h
//  Standup-iOS
//
//  Created by Josefin Andersson on 2014-06-13.
//  Copyright (c) 2014 FrostDigital. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FDMyTodoTableViewCellCheckButtonDelegate;

@interface FDMyTodoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *todoLabel;
@property (weak, nonatomic) IBOutlet UIButton *checkButton;
@property (weak, nonatomic) id<FDMyTodoTableViewCellCheckButtonDelegate> delegate;

- (IBAction)checkButtonTapped:(id)sender;

@end

@protocol FDMyTodoTableViewCellCheckButtonDelegate <NSObject>

- (void) checkButtonTappedInCell:(FDMyTodoTableViewCell *) cell;

@end