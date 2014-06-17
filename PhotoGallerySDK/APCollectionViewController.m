//
//  APPhotoGalleryCollectionViewController.m
//  PhotoGallery
//
//  Created by alexander.pranevich on 6/16/14.
//  Copyright (c) 2014 Alexander Pronevich. All rights reserved.
//

#import "APCollectionViewController.h"
#import "APPhotoDetailViewController.h"
#import "APCollectionViewCell.h"
#import "SDWebImage/UIImageView+WebCache.h"

@interface APCollectionViewController ()

@end

@implementation APCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSArray *visibleCells = [self.collectionView visibleCells];
    if (visibleCells)
    {
        for (APCollectionViewCell *cell in visibleCells)
        {
            [cell.imageView cancelCurrentImageLoad];
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - UICollectionView Datasource

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section
{
    return [self.photos count];
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    APCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"APCollectionViewCell" forIndexPath:indexPath];
    APPhoto *currentPhoto = self.photos[indexPath.row];
    if (currentPhoto.image)
    {
        [cell.imageView setImage:currentPhoto.image];
        [cell.activityIndicatorView setHidden:YES];
    }
    else
    {
        [cell.activityIndicatorView startAnimating];
        [cell.imageView setImageWithURL:currentPhoto.url
                              completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
                                  NSLog(@"image at index %d loaded",indexPath.row);
                                  [cell.activityIndicatorView stopAnimating];
                                  [cell.activityIndicatorView setHidden:YES];
                              }];
    }

    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO: Select Item
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    [((APCollectionViewCell *)cell).imageView cancelCurrentImageLoad];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UICollectionViewCell *cell = (UICollectionViewCell *)sender;
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
    
    [(APPhotoDetailViewController*)[segue destinationViewController] setPhoto:self.photos[indexPath.row]];
}



@end
