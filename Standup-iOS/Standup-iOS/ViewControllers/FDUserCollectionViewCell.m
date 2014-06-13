//
//  FDUserCollectionViewCell.m
//  Standup-iOS
//
//  Created by Josefin Andersson on 2014-06-13.
//  Copyright (c) 2014 FrostDigital. All rights reserved.
//

#import "FDUserCollectionViewCell.h"

@implementation FDUserCollectionViewCell

- (void)awakeFromNib
{
    UIColor *trancperantBlack = [UIColor colorWithWhite:0 alpha:0.4];
    _timeLabel.backgroundColor = trancperantBlack;
    _nameLabel.backgroundColor = trancperantBlack;
}

@end
