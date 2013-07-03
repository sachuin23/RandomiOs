//
//  MLNoteTableViewController.h
//  NotePad
//
//  Created by Rajan, Pankaj on 6/15/13.
//  Copyright (c) 2013 missingLink. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MLNoteModel;
@class MLNoteModelStore;
@interface MLNoteTableViewController : UITableViewController{
    
    MLNoteModelStore* noteModelStore_;
}

@property(strong, nonatomic)MLNoteModelStore* noteModelStore;

-(void)addNewItem;

@end
