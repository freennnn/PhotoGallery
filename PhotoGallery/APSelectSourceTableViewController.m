//
//  APViewController.m
//  PhotoGallery
//
//  Created by alexander.pranevich on 6/16/14.
//  Copyright (c) 2014 Alexander Pronevich. All rights reserved.
//

#import "APSelectSourceTableViewController.h"
#import "APCollectionViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface APSelectSourceTableViewController ()

@end

@implementation APSelectSourceTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITalbeViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PhotoGallery" bundle:nil];
    APCollectionViewController *photoGalleryViewController = [storyboard instantiateViewControllerWithIdentifier:@"APCollectionViewController"];
    NSMutableArray *photos = [[NSMutableArray alloc] init];
    
    switch (indexPath.row) {
        case 0:
            //TODO: exchange hardcoded urls with flicker/google search api
            
            [photos addObject:[APPhoto photoWithURL:[NSURL URLWithString:@"http://farm4.static.flickr.com/3567/3523321514_371d9ac42f_b.jpg"]]];
            [photos addObject:[APPhoto photoWithURL:[NSURL URLWithString:@"http://farm4.static.flickr.com/3629/3339128908_7aecabc34b_b.jpg"]]];
            [photos addObject:[APPhoto photoWithURL:[NSURL URLWithString:@"http://farm4.static.flickr.com/3364/3338617424_7ff836d55f_b.jpg"]]];
            [photos addObject:[APPhoto photoWithURL:[NSURL URLWithString:@"http://farm4.static.flickr.com/3590/3329114220_5fbc5bc92b_b.jpg"]]];
            [photos addObject:[APPhoto photoWithURL:[NSURL URLWithString:@"http://farm3.static.flickr.com/2449/4052876281_6e068ac860_b.jpg"]]];
            
            photoGalleryViewController.photos = photos;
            [self.navigationController pushViewController:photoGalleryViewController animated:YES];
            
            break;
        case 1:
        {
            //TODO: save info to retrieve fullImageRespresentation for Details Screen
            
            ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
            [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
                [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
                    if(result)
                    {
                        [photos addObject:[APPhoto photoWithImage:[UIImage imageWithCGImage:[result thumbnail]]]];
                        NSLog(@"result = %@", result);
                    }
                }];
                if (!group) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        photoGalleryViewController.photos = photos;
                        [self.navigationController pushViewController:photoGalleryViewController animated:YES];
                    });
                }
            }
            failureBlock:^(NSError *error) {
                NSLog(@"Error loading device gallery images %@", error);
            }];
            break;
        }
        default:
            break;
    }
}

@end
