//
//  MLImageStore.h
//  NotePad
//
//  Created by Rajan, Pankaj on 6/17/13.
//  Copyright (c) 2013 missingLink. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MLImageData;

@interface MLImageStore : NSObject <NSCoding>{
    
    
    NSMutableArray* imageDic;
}


/**
 @returns count of all images in the store
 */
-(NSUInteger)itemCount;

/**
 @returns all images of image store
 */
-(NSArray*)allImages;

/**
 @returns image with given key of the key store
 */
-(MLImageData*)imageWithKey:(NSString*)key;

/**
 @return add image to dictionary
 */
-(void) addImage:(MLImageData *)imageData;
/**
 @ delete image with key
 */
-(void) deleteImageAtIndex:(NSUInteger)index;


@end
