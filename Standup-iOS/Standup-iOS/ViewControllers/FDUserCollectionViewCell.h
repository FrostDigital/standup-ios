//
//  FDUserCollectionViewCell.h
//  Standup-iOS
//
//  Created by Josefin Andersson on 2014-06-13.
//  Copyright (c) 2014 FrostDigital. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FDUserCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *stoodUpImageView;
@property (weak, nonatomic) IBOutlet UIImageView *badgeImageView;

@end
