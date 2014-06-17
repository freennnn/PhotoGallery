//
//  APPhoto.h
//  PhotoGallery
//
//  Created by alexander.pranevich on 6/16/14.
//  Copyright (c) 2014 Alexander Pronevich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APPhoto : NSObject
@property (nonatomic, strong, readonly) NSURL *url;
@property (nonatomic, strong, readonly) UIImage *image;

+ (APPhoto *)photoWithURL:(NSURL *)url;
+ (APPhoto *)photoWithImage:(UIImage *)image;

@end
