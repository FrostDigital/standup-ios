//
//  FDDashboardViewController.m
//  Standup-iOS
//
//  Created by Josefin Andersson on 2014-06-13.
//  Copyright (c) 2014 FrostDigital. All rights reserved.
//

#import "FDDashboardViewController.h"
#import "FDStandupTableViewController.h"
#import <UIImageView+AFNetworking.h>
#import "FDUserCollectionViewCell.h"
#import "FDTeamStorage.h"
#import "FDTeam.h"
#import "FDUser.h"
#import "FDStandup.h"
#import "FDStandupUser.h"
#import "FDDateUtils.h"

@interface FDDashboardViewController ()
@end

@implementation FDDashboardViewController
{
    FDTeam *team;
    NSDate *selectedDate;
    FDUser *selectedUser;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    team = [[FDTeamStorage sharedStorage] activeTeam];
    selectedDate = [NSDate date];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (IBAction)openSettings:(id)sender
{
    [self performSegueWithIdentifier:FDSegueDashboardToSettings sender:self];
}

- (IBAction)addStandup:(id)sender
{
    [self performSegueWithIdentifier:FDSegueDashboardToMyStandup sender:self];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return team.users.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FDUserCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FDUserCollectionCell" forIndexPath:indexPath];
    
    FDUser *user = [team.users objectAtIndex:indexPath.row];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView setImageWithURL:[NSURL URLWithString:user.avatar] placeholderImage:[UIImage imageNamed:@"User Avatar"]];
    cell.backgroundView = imageView;
    cell.nameLabel.text = user.name;
    
    BOOL hasStoodUpToday = NO;
    
    for (FDStandup *standup in team.standups)
    {
        if ([FDDateUtils isSameDate:standup.date asCompareDate:selectedDate])
        {
            for (FDStandupUser *standupUser in standup.users)
            {
                if ([user.userId isEqualToString:standupUser.userId])
                {
                    hasStoodUpToday = YES;
                }
            }
        }
    }
    
    cell.stoodUpImageView.image = hasStoodUpToday ? [UIImage imageNamed:@"Check Mark Badge"] : [UIImage imageNamed:@"Exclamation Mark Badge"];
    cell.badgeImageView.image = [UIImage imageNamed:@"Badge 1"];
    cell.timeLabel.text = hasStoodUpToday ? [NSString stringWithFormat:@"08:0%lu", indexPath.row + 1] : @"--:--";
    cell.timeLabel.textColor = hasStoodUpToday ? [UIColor greenColor] : [UIColor redColor];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    selectedUser = [[[[FDTeamStorage sharedStorage] activeTeam] users] objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:FDSegueDashboardToOthersStandup sender:self];
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(160, 160);
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:FDSegueDashboardToMyStandup])
    {
        FDStandupTableViewController *standupVC = (FDStandupTableViewController *)segue.destinationViewController;
        standupVC.isMyStandup = YES;
        standupVC.date = selectedDate;
        standupVC.user = selectedUser;
    }
    else if ([segue.identifier isEqualToString:FDSegueDashboardToOthersStandup])
    {
        FDStandupTableViewController *standupVC = (FDStandupTableViewController *)segue.destinationViewController;
        standupVC.isMyStandup = NO;
        standupVC.date = selectedDate;
        standupVC.user = selectedUser;
    }
    else if ([segue.identifier isEqualToString:FDSegueDashboardToSettings])
    {
        
    }
    
}
@end
