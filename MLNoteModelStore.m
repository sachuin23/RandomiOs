//
//  MLNoteModelStore.m
//  NotePad
//
//  Created by Rajan, Pankaj on 6/26/13.
//  Copyright (c) 2013 missingLink. All rights reserved.
//

#import "MLNoteModelStore.h"

static NSString* kNoteModelArrayKey=@"noteModelArrayKey";

@interface MLNoteModelStore()

@property (nonatomic,strong)NSMutableArray* noteModelArray;
@end
@implementation MLNoteModelStore

@synthesize noteModelArray=noteModelArray_;
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if(self)
    {
        [self setNoteModelArray:[aDecoder decodeObjectForKey:kNoteModelArrayKey]];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:noteModelArray_ forKey:kNoteModelArrayKey];
}

-(void)addNoteModelToStore:(MLNoteModel *)noteModel
{
    [self.noteModelArray addObject:noteModel];
}

-(void)removeNoteModelFromStore:(MLNoteModel *)noteModel
{
    [self.noteModelArray removeObject:noteModel];
}

-(NSUInteger)itemCount
{
    return [self.noteModelArray count];
}

-(MLNoteModel*)itemAtIndex:(NSUInteger)index
{
    return  [self.noteModelArray objectAtIndex:index];
}

-(void)removeItemAtIndex:(NSUInteger)index
{
    [self.noteModelArray removeObjectAtIndex:index];
}

-(id)init
{
    self = [super init];
    if(self)
    {
        noteModelArray_ = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(NSString*)pathToSavedFile
{
    NSArray* documentDir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* docDir = [documentDir objectAtIndex:0];
    return [docDir stringByAppendingString:@"noteModelStore.archive"];
}

-(BOOL)saveState
{
    NSString* path = [self pathToSavedFile];
    return [NSKeyedArchiver archiveRootObject:self.noteModelArray toFile:path];
}
@end
