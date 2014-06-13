//
//  FDStandupTableViewController.m
//  Standup-iOS
//
//  Created by Josefin Andersson on 2014-06-13.
//  Copyright (c) 2014 FrostDigital. All rights reserved.
//

#import "FDStandupTableViewController.h"
#import "FDOthersTodoTableViewCell.h"

@interface FDStandupTableViewController ()

@end

@implementation FDStandupTableViewController
{
    NSArray *todayToDos;
    NSArray *yesterdayToDos;
    NSDictionary *standUps;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = _isMyStandup ? @"My Standup" : @"Other's Standup";
    
    todayToDos = @[@"Make coffee", @"Code a standapp"];
    yesterdayToDos = @[@"Code Easyhunt", @"Meeting with Malin from Sundare Barn"];
    
    standUps = @{@"today": todayToDos, @"yesterday": yesterdayToDos};
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[standUps allValues] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[standUps allValues] objectAtIndex:section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_isMyStandup)
    {
        FDMyTodoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FDMyTodoTableViewCell" forIndexPath:indexPath];
        
        cell.delegate = self;
        
        cell.todoLabel.text = [[[standUps allValues] objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        [cell.checkButton setImage:[UIImage imageNamed:@"Checkbox Empty"] forState:UIControlStateNormal];
        
        return cell;
    }
    
    FDOthersTodoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FDOthersTodoTableViewCell" forIndexPath:indexPath];
    
    cell.todoLabel.text = [[[standUps allValues] objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.imageView.image = indexPath.row % 2 == 0 ? [UIImage imageNamed:@"Check Mark"] : [UIImage imageNamed:@"Dot Mark"];
    
    return cell;
}

#pragma mark - Table view delegate

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return @"TODAY";
    }
    
    return @"YESTERDAY";
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

#pragma mark - FDMyTodoTableViewCellCheckButtonDelegate

- (void)checkButtonTappedInCell:(FDMyTodoTableViewCell *)cell
{
    [cell.checkButton setImage:[UIImage imageNamed:@"Checkbox Done"] forState:UIControlStateNormal];
}

@end
