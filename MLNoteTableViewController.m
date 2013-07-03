//
//  MLNoteTableViewController.m
//  NotePad
//
//  Created by Rajan, Pankaj on 6/15/13.
//  Copyright (c) 2013 missingLink. All rights reserved.
//

#import "MLNoteTableViewController.h"
#import "MLNoteViewController.h"
#import "MLNoteModel.h"
#import "MLImageData.h"
#import "MLNoteModelStore.h"

@interface MLNoteTableViewController ()

@end
@implementation MLNoteTableViewController
@synthesize noteModelStore=noteModelStore_;

- (id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

-(id)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if(self)
    {
        UINavigationItem* item = [self navigationItem];
        [item setTitle:@"Note App"];
        
        // Programatically add right button item
        UIBarButtonItem* bitem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem)];
        [item setRightBarButtonItem:bitem];
        
        // Add Edit Button
        [item setLeftBarButtonItem:[self editButtonItem]];
        
        noteModelStore_ = [[MLNoteModelStore alloc] init];
        self.tableView.delegate = self;
        
    }
    return self;
}

-(void)addNewItem
{
    MLNoteViewController* nvC = [[MLNoteViewController alloc] initWithNibName:nil bundle:nil];
    
    MLNoteModel* nmodel= [[MLNoteModel alloc]initWithDefaultState:YES];
    [self.noteModelStore addNoteModelToStore:nmodel];
    [nvC setNoteModel:nmodel];
    [self.navigationController pushViewController:nvC animated:YES];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if([self.noteModelStore itemCount]>0){
        [self.tableView reloadData];
    }
}
- (void)viewDidLoad
{
    //[super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if([self.noteModelStore itemCount]>0)
    {
        return [self.noteModelStore itemCount];
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"NoteCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if(self.noteModelStore !=nil)
    {
        MLNoteModel* instance = [self.noteModelStore itemAtIndex:indexPath.row];
        if(instance.noteTitle==nil || [instance.noteTitle isEqualToString:@""])
        {
            [cell.textLabel setText:@"UNKNOWN TITLE"];
        }
        else{
            [cell.textLabel  setText:instance.noteTitle];
        }
        if([instance.imageStore allImages]!=nil)
        {
            if([instance.imageStore allImages].count >0){
                MLImageData* imageData= [[instance.imageStore allImages]objectAtIndex:0];
                
                [cell.imageView setImage:imageData.image];
            }
        }
    }
    
    return cell;
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
        
        if([self.noteModelStore  itemCount] >0)
        {
            [self.noteModelStore removeItemAtIndex:indexPath.row];
            // Delete the row from the data source
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
        
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    
}

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
    if([self.noteModelStore itemCount] >0)
    {
        MLNoteViewController* nvc = [[MLNoteViewController alloc]initWithNibName:nil bundle:nil];
        [nvc setNoteModel:[self.noteModelStore itemAtIndex:indexPath.row]];
        [self.navigationController pushViewController:nvc animated:YES];
        
    }
}

@end
