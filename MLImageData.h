//
//  MLImageData.h
//  NotePad
//
//  Created by Rajan, Pankaj on 6/20/13.
//  Copyright (c) 2013 missingLink. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLImageData : NSObject
{
    
    NSString* imageTitle_;
    NSString* imageCaption_;
    UIImage*  image_;
    double    imageLong_;
    double    imageLat_;
    NSString* imageKey_;
    BOOL      isDefaultState_;
}


@property(nonatomic,strong)NSString* imageTitle;
@property(nonatomic, strong)NSString* imageCaption;
@property(nonatomic,strong)UIImage*   image;
@property (nonatomic, strong)NSString* imageKey;
@property (nonatomic,assign)BOOL isDefaultState;

-(id)initWithImage:(UIImage*)image  imageKey:(NSString*)imageKey Title:(NSString*)title andCaption:(NSString*)caption;


-(void)updateImageData:(NSString*)imageTitle andCaption:(NSString*)imageCaption;

@end
