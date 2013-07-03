//
//  MLImageStore.m
//  NotePad
//
//  Created by Rajan, Pankaj on 6/17/13.
//  Copyright (c) 2013 missingLink. All rights reserved.
//

#import "MLImageStore.h"
#import "MLImageData.h"

static NSString* kImageKey =@"imageKey";
@interface MLImageStore()

@property(nonatomic,strong)NSMutableArray* imageDicProp;
@end
@implementation MLImageStore

@synthesize imageDicProp=imageDic;
-(id) init
{
    self = [super init];
    if(self)
    {
        imageDic = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(void)addImage:(MLImageData *)imageData
{
    [imageDic addObject:imageData];
     
}

-(NSUInteger)itemCount
{
    return [self.imageDicProp count];
}

-(void)removeImageAtIndex:(NSUInteger)index
{
    [self.imageDicProp removeObjectAtIndex:index];
}
-(MLImageData*)imageAtIndex:(NSUInteger)index
{
    
    return [imageDic objectAtIndex:index];
}

-(NSArray*)allImages
{
    return self.imageDicProp;
}


-(void)deleteImageAtIndex:(NSUInteger)index
{
    [imageDic removeObjectAtIndex:index];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self  = [super init];
    if(self)
    {
        self.imageDicProp =[aDecoder decodeObjectForKey:kImageKey];
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.imageDicProp forKey:kImageKey];
}


@end
