//
//  MLImageData.m
//  NotePad
//
//  Created by Rajan, Pankaj on 6/20/13.
//  Copyright (c) 2013 missingLink. All rights reserved.
//

#import "MLImageData.h"


static NSString* kImageTitleKey=@"imageTitle";
static NSString* kImageCaptionKey=@"imageCaption";
static NSString* kImageKey=@"simageKey";
static NSString* kIsDefaultStateKey =@"defaultStateKey";
static NSString*  kUIImageKey =@"UIImageKey";

@implementation MLImageData

@synthesize image=image_;
@synthesize imageCaption=imageCaption_;
@synthesize imageTitle=imageTitle_;
@synthesize imageKey=imageKey_;
@synthesize isDefaultState=isDefaultState;

-(id)init
{
    self = [super init];
    if(self)
    {
        
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self  = [super init];
    if(self)
    {
        self.image =[aDecoder decodeObjectForKey:kUIImageKey];
        self.imageCaption =[aDecoder decodeObjectForKey:kImageCaptionKey];
        self.imageTitle =[aDecoder decodeObjectForKey:kImageTitleKey];
        self.isDefaultState =[aDecoder decodeBoolForKey:kIsDefaultStateKey];
        self.imageKey       =[aDecoder decodeObjectForKey:kImageKey];
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.imageKey forKey:kImageKey];
    [aCoder encodeObject:self.imageTitle forKey:kImageTitleKey];
    [aCoder encodeObject:self.imageCaption forKey:kImageCaptionKey];
    [aCoder encodeObject:self.image forKey:kUIImageKey];
}
-(id)initWithImage:(UIImage*)image  imageKey:(NSString*)imageKey Title:(NSString*)title andCaption:(NSString*)caption
{
    self =[self init];
    self.image=image;
    self.imageCaption=caption;
    self.imageTitle=title;    
    self.imageKey =imageKey;
    self.isDefaultState=YES;
    return self;
}

-(void)updateImageData:(NSString*)imageTitle andCaption:(NSString*)imageCaption
{
    self.imageTitle =imageTitle;
    self.imageCaption=imageCaption;
}

@end
