//
//  APCollectionViewCell.h
//  PhotoGallery
//
//  Created by alexander.pranevich on 6/16/14.
//  Copyright (c) 2014 Alexander Pronevich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UIImageView* imageView;
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *activityIndicatorView;

@end
