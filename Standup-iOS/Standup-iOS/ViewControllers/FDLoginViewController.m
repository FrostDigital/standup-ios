//
//  FDLoginViewController.m
//  Standup-iOS
//
//  Created by Josefin Andersson on 2014-06-13.
//  Copyright (c) 2014 FrostDigital. All rights reserved.
//

#import "FDLoginViewController.h"
#import "FDAPIClient.h"

@interface FDLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation FDLoginViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)login:(id)sender
{
    [[FDAPIClient sharedInstance] getTeamWithId:@"c31f2edac0aac0baf39a4110d2bfefcb3a3f0ea1" success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        [self performSegueWithIdentifier:FDSegueLoginToDashboard sender:self];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        [[[UIAlertView alloc] initWithTitle:@"Error Get Team" message:error.localizedDescription delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }];
}
@end
