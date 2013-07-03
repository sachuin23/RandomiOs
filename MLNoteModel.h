//
//  MLNoteModel.h
//  NotePad
//
//  Created by Rajan, Pankaj on 6/15/13.
//  Copyright (c) 2013 missingLink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLImageStore.h"

@interface MLNoteModel : NSObject <NSCoding>{
    
    NSString* noteTitle_;
    NSString* noteBody_;
    NSMutableArray* imageArray_;
    NSDate* lasModifiedDate_;
    MLImageStore* imageStore_;
    BOOL  isDefaultState_;
}

@property(nonatomic, strong)NSString* noteTitle;
@property(nonatomic, strong)NSString* noteBody;
@property(nonatomic, strong)NSString* imageArray;
@property(nonatomic, strong)NSDate*   lastModifiedDate;
@property(nonatomic, strong)NSArray*  allImages;
@property (nonatomic, strong)MLImageStore* imageStore;
@property (nonatomic, assign)BOOL isDefaultState;

-(id)initWithDefaultState:(BOOL) state;

@end
