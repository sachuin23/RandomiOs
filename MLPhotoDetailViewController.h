//
//  MLPhotoDetailViewController.h
//  NotePad
//
//  Created by Rajan, Pankaj on 6/19/13.
//  Copyright (c) 2013 missingLink. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MLImageStore;
@class MLImageData;
@class MLNoteModel;

@interface MLPhotoDetailViewController : UIViewController<UITextFieldDelegate,UITextViewDelegate>{
    
    MLImageStore* imageStore_;
    UIImage* image_;
    
    MLImageData* imageDataInstance_;
    
    MLNoteModel* noteModel_;

    IBOutlet UITextView* imageCaption;
    IBOutlet UITextField* imageTitle;
    IBOutlet UIView* view;
    
}

@property (weak, nonatomic) IBOutlet UIImageView *displayImage;
@property(nonatomic,strong)MLImageStore* imageStore;
@property(nonatomic,strong)UIImage* image;
@property (nonatomic, strong) MLNoteModel* noteModel;
-(void)loadImageToView:(MLImageData*)imageData;

-(IBAction)dismissKeyBoard:(id)sender;
@end
