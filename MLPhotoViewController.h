//
//  MLPhotoViewController.h
//  NotePad
//
//  Created by Rajan, Pankaj on 6/19/13.
//  Copyright (c) 2013 missingLink. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MLImageStore;
@class MLNoteModel;
@interface MLPhotoViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate,UINavigationControllerDelegate>{
    
    MLImageStore* imageStore_;
    MLNoteModel* noteModel_;
    
}
@property (nonatomic, strong)MLImageStore* imageStore;
@property (nonatomic, strong)MLNoteModel* noteModel;
@end
