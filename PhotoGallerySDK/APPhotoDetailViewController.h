//
//  APPhotoDetailViewController.h
//  PhotoGallery
//
//  Created by alexander.pranevich on 6/17/14.
//  Copyright (c) 2014 Alexander Pronevich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APPhoto.h"

@interface APPhotoDetailViewController : UIViewController
@property (nonatomic, strong) APPhoto *photo;
@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@end
