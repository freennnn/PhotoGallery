//
//  APPhoto.h
//  PhotoGallery
//
//  Created by alexander.pranevich on 6/16/14.
//  Copyright (c) 2014 Alexander Pronevich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APPhoto : NSObject
@property (nonatomic, readonly) NSURL *url;

+ (APPhoto *)photoWithURL:(NSURL *)url;

@end
