//
//  MLPhotoDetailViewController.m
//  NotePad
//
//  Created by Rajan, Pankaj on 6/19/13.
//  Copyright (c) 2013 missingLink. All rights reserved.
//

#import "MLPhotoDetailViewController.h"
#import "MLNoteModel.h"
#import "MLImageData.h"

@interface MLPhotoDetailViewController ()

@end

@implementation MLPhotoDetailViewController

@synthesize imageStore=imageStore_;
@synthesize image=image_;
@synthesize noteModel= noteModel_;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

-(void)loadImageToView:(MLImageData*)imageData
{
    imageDataInstance_ = imageData;
    
}


-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [imageTitle resignFirstResponder];
}
-(void)textViewDidEndEditing:(UITextView *)textView
{
    [imageCaption resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [imageCaption setDelegate:self];
    [imageTitle   setDelegate:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [imageTitle resignFirstResponder];
    return YES;
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.displayImage setImage:self.image];
    [imageTitle setDelegate:self];
    [imageCaption setDelegate:self];
    if(imageDataInstance_)
    {
        imageTitle.text= imageDataInstance_.imageTitle;
        imageCaption.text= imageDataInstance_.imageCaption;
        image_ = imageDataInstance_.image;
        [self.displayImage setImage:image_];
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    if(!imageDataInstance_)
    {
        NSString* imageKey = [self generateUUID];
        MLImageData* imageData = [[MLImageData alloc] initWithImage:self.image imageKey:imageKey Title:imageTitle.text andCaption:imageCaption.text];
        [self.noteModel.imageStore addImage:imageData];
         }
    else{
        imageDataInstance_.imageTitle=imageTitle.text;
        imageDataInstance_.imageCaption=imageCaption.text;
    }
    [imageCaption setDelegate:nil];
    [imageTitle setDelegate:nil];
    
    NSLog(@"Need to save information about image here");
}

-(void)textViewDidBeginEditing:(UITextView *)textView
{
    if(!imageDataInstance_){
        [imageCaption setText:@""];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    if ([imageCaption isFirstResponder] && [touch view] != imageCaption) {
        [imageCaption resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}

-(NSString*)generateUUID
{
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    CFStringRef str = CFUUIDCreateString(NULL, uuid);
    CFRelease(uuid);
    return (NSString*)CFBridgingRelease(str);
}

@end
