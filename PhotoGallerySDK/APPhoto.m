//
//  APPhoto.m
//  PhotoGallery
//
//  Created by alexander.pranevich on 6/16/14.
//  Copyright (c) 2014 Alexander Pronevich. All rights reserved.
//

#import "APPhoto.h"

@implementation APPhoto

- (id)initWithURL:(NSURL *)url
{
	if (self = [super init])
    {
		_url = [url copy];
	}
	return self;
}

- (id)initWithImage:(UIImage*)image
{
    if (self = [super init])
    {
        _image = image;
    }
    return self;
}

+ (APPhoto *)photoWithURL:(NSURL *)url
{
	return [[APPhoto alloc] initWithURL:url];
}

+ (APPhoto *)photoWithImage:(UIImage *)image
{
	return [[APPhoto alloc] initWithImage:image];
}

@end
