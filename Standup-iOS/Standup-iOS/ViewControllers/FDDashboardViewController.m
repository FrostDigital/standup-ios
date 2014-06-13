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

@interface FDDashboardViewController ()
@end

@implementation FDDashboardViewController
{
    NSArray *images;
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
    // Do any additional setup after loading the view.
    
    // http://critterbabies.com/wp-content/gallery/kittens/cute-kitten-playing.jpg
    // http://sereedmedia.com/srmwp/wp-content/uploads/kitten.jpg
    // http://kalle.cafe.se/files/2012/02/Cute-Kitten-kittens-16122946-1280-800.jpeg
    // http://critterbabies.com/wp-content/gallery/kittens/happy-kitten-kittens-5890512-1600-1200.jpg

    
    images = @[@"http://critterbabies.com/wp-content/gallery/kittens/cute-kitten-playing.jpg",
               @"http://sereedmedia.com/srmwp/wp-content/uploads/kitten.jpg",
               @"http://kalle.cafe.se/files/2012/02/Cute-Kitten-kittens-16122946-1280-800.jpeg",
               @"http://critterbabies.com/wp-content/gallery/kittens/happy-kitten-kittens-5890512-1600-1200.jpg",
               @"http://critterbabies.com/wp-content/gallery/kittens/cute-kitten-playing.jpg",
               @"http://sereedmedia.com/srmwp/wp-content/uploads/kitten.jpg",
               @"http://kalle.cafe.se/files/2012/02/Cute-Kitten-kittens-16122946-1280-800.jpeg",
               @"http://critterbabies.com/wp-content/gallery/kittens/happy-kitten-kittens-5890512-1600-1200.jpg",
               @"http://critterbabies.com/wp-content/gallery/kittens/cute-kitten-playing.jpg",
               @"http://sereedmedia.com/srmwp/wp-content/uploads/kitten.jpg",
               @"http://kalle.cafe.se/files/2012/02/Cute-Kitten-kittens-16122946-1280-800.jpeg",
               @"http://critterbabies.com/wp-content/gallery/kittens/happy-kitten-kittens-5890512-1600-1200.jpg",
               @"http://critterbabies.com/wp-content/gallery/kittens/cute-kitten-playing.jpg",
               @"http://sereedmedia.com/srmwp/wp-content/uploads/kitten.jpg",
               @"http://kalle.cafe.se/files/2012/02/Cute-Kitten-kittens-16122946-1280-800.jpeg",
               @"http://critterbabies.com/wp-content/gallery/kittens/happy-kitten-kittens-5890512-1600-1200.jpg"];
    
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
    return images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FDUserCollectionCell" forIndexPath:indexPath];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView setImageWithURL:[NSURL URLWithString:images[indexPath.row]] placeholderImage:[UIImage imageNamed:@"NotificationBackgroundSuccess.png"]];
    
    cell.backgroundView = imageView;
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
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
    }
    else if ([segue.identifier isEqualToString:FDSegueDashboardToOthersStandup])
    {
        FDStandupTableViewController *standupVC = (FDStandupTableViewController *)segue.destinationViewController;
        standupVC.isMyStandup = NO;
    }
    else if ([segue.identifier isEqualToString:FDSegueDashboardToSettings])
    {
        
    }
    
}
@end
