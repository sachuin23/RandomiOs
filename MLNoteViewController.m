//
//  MLNoteViewController.m
//  NotePad
//
//  Created by Rajan, Pankaj on 6/17/13.
//  Copyright (c) 2013 missingLink. All rights reserved.
//

#import "MLNoteViewController.h"
#import "MLPhotoViewController.h"
#import "MLPhotoDetailViewController.h"
#import "MLImageData.h"

@interface MLNoteViewController ()

@end

@implementation MLNoteViewController

@synthesize noteModel= noteModel_;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UINavigationItem* item = [self navigationItem];
        [item setTitle:@"New Note"];
        
        [item setRightBarButtonItem:[self editButtonItem]];
        self.hasStartEditing =NO;
    }
    return self;
}

-(void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    if([self isEditing])
    {
        [self.noteBody setEditable:YES];
        [self.noteTitle setEnabled:YES];
        [self.view setBackgroundColor:[UIColor clearColor]];
        if(self.noteModel.isDefaultState && (self.hasStartEditing==NO)){
            [self.noteBody setText:@"" ];
            self.hasStartEditing=YES;
        }
    }
    else{
        

        [self saveNoteData];
        [self.noteBody resignFirstResponder];
    }

}

//-(void)saveNote:(id)sender
//{
//    [self.noteModel     setNoteTitle: self.noteTitle.text];
//    [self.noteModel     setNoteBody:self.noteBody.text];
//    [self.noteModel     setIsDefaultState:NO];
//    [self.noteBody setEditable:NO];
//    [self.noteTitle setEnabled:NO];
//}

-(void)saveNoteData
{
    [self.noteModel     setNoteTitle: self.noteTitle.text];
    [self.noteModel     setNoteBody:self.noteBody.text];
    [self.noteModel     setIsDefaultState:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.noteTitle setDelegate:self];
    [self.noteBody  setDelegate:self];
    [self.noteBody setScrollEnabled:YES];
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [self.noteTitle resignFirstResponder];
}

-(void)textViewDidBeginEditing:(UITextView *)textView
{
    if(self.noteModel.isDefaultState && (self.hasStartEditing==NO)){
    [self.noteBody setText:@"" ];
        self.hasStartEditing=YES;
    }
    

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.noteTitle resignFirstResponder];
    return YES;
}
-(BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    return YES;
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
    [self.noteBody resignFirstResponder];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)showNoteImages:(id)sender
{
    MLPhotoViewController* pvc = [[MLPhotoViewController alloc]initWithNibName:nil bundle:nil];
    [pvc setImageStore:self.noteModel.imageStore];
    [self.navigationController pushViewController:pvc animated:YES];
}

-(void)takePicture:(id)sender
{
    UIImagePickerController* imagePicker = [[UIImagePickerController alloc] init];
    
    //[imagePicker setAllowsEditing:YES];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
        // Logic for Camera to take pic
    }
    else
    {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    
    [imagePicker setDelegate:self];
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    UIImage* image = [info objectForKey:UIImagePickerControllerOriginalImage];
    MLPhotoDetailViewController* phDelCont = [[MLPhotoDetailViewController alloc]initWithNibName:nil bundle:nil];
    [phDelCont setImage:image];
    [phDelCont setImageStore:self.noteModel.imageStore];
    [phDelCont setNoteModel:self.noteModel];
    [self.navigationController pushViewController:phDelCont animated:YES];    

    
}

-(void)viewWillAppear:(BOOL)animated
{
    if(!self.noteModel.isDefaultState)
    {
        self.noteTitle.text = self.noteModel.noteTitle;
        self.noteBody.text  =self.noteModel.noteBody;
        [self.noteTitle setEnabled:NO];
        [self.noteBody  setEditable:NO];
        [self.view setBackgroundColor:[UIColor lightGrayColor]];
        
    }
    else
    {
        [self.noteTitle setEnabled:YES];
        [self.noteBody  setEditable:YES];
        [self.view setBackgroundColor:[UIColor lightTextColor]];
    }

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    if ([self.noteBody isFirstResponder] && [touch view] != self.noteBody ) {
        [self.noteBody  resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
    if([self isEditing])
    {
        [self.noteBody setEditable:NO];
        [self setEditing:NO animated:YES];
    }
}
-(void)viewWillDisappear:(BOOL)animated
{
    [self.noteModel setNoteTitle:self.noteTitle.text];
    [self.noteModel setNoteBody:self.noteBody.text];
    [self.noteModel setIsDefaultState:NO];
}

//-(void)editNote:(id)sender
//{
// 
//    if(![self isEditing])
//    {
//        [self setEditing:YES animated:NO];
//    }
//    else
//    {
//        [self setEditing:NO animated:YES];
//    }
//    [self editButtonItem];
//}

@end
