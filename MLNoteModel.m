//
//  MLNoteModel.m
//  NotePad
//
//  Created by Rajan, Pankaj on 6/15/13.
//  Copyright (c) 2013 missingLink. All rights reserved.
//

#import "MLNoteModel.h"

static  NSString* kNoteBodyKey=@"noteBodyKey";
static  NSString* kNoteTitleKey =@"noteTitleKey";
static  NSString* kImageStoreKey=@"imageStoreKey";
static  NSString* kIsDefaultStateKey =@"isDefaultStateKey";

@implementation MLNoteModel

@synthesize noteBody=noteBody_;
@synthesize noteTitle=noteTitle_;
@synthesize lastModifiedDate= lasModifiedDate_;
@synthesize imageStore=imageStore_;
@synthesize isDefaultState=isDefaultState_;


-(id)init
{
    self = [super init];
    if(self)
    {
        
        imageStore_ = [[MLImageStore alloc]init];
    }
    
    return self;
}

-(id)initWithDefaultState:(BOOL) state
{

    self = [self init];
    self.isDefaultState= state;
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if(self)
    {
        self.noteBody = [aDecoder decodeObjectForKey:kNoteBodyKey];
        self.noteTitle =[aDecoder decodeObjectForKey:kNoteTitleKey];
        self.imageStore = [aDecoder decodeObjectForKey:kImageStoreKey];
        self.isDefaultState = [aDecoder decodeBoolForKey:kIsDefaultStateKey];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.noteTitle forKey:kNoteTitleKey];
    [aCoder encodeObject:self.noteBody forKey:kNoteBodyKey];
    [aCoder encodeObject:self.imageStore forKey:kImageStoreKey];
    [aCoder encodeBool:self.isDefaultState forKey:kIsDefaultStateKey];
    
}

@end
