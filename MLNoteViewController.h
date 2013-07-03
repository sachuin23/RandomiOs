//
//  MLNoteViewController.h
//  NotePad
//
//  Created by Rajan, Pankaj on 6/17/13.
//  Copyright (c) 2013 missingLink. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLNoteModel.h"

@interface MLNoteViewController : UIViewController<UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextViewDelegate>{
    UIBarButtonItem* bitem_;
    MLNoteModel* noteModel_;
}
@property (weak, nonatomic) IBOutlet UITextField *noteTitle;
@property (weak, nonatomic) IBOutlet UITextView *noteBody;
@property (strong, nonatomic)MLNoteModel* noteModel;
@property (nonatomic,assign)BOOL hasStartEditing;

-(IBAction)takePicture:(id)sender;

-(IBAction)showNoteImages:(id)sender;


@end
