//
//  MLNoteModelStore.h
//  NotePad
//
//  Created by Rajan, Pankaj on 6/26/13.
//  Copyright (c) 2013 missingLink. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MLNoteModel;
@interface MLNoteModelStore : NSObject <NSCoding>
{
    NSMutableArray* noteModelArray_;
}

-(void) addNoteModelToStore:(MLNoteModel*) noteModel;
-(void) removeNoteModelFromStore:(MLNoteModel*)noteModel;
-(void)removeItemAtIndex:(NSUInteger)index;
-(MLNoteModel*) itemAtIndex:(NSUInteger)index;
-(NSUInteger)itemCount;
-(BOOL)saveState;

@end
