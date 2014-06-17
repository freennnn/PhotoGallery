//
//  APViewController.m
//  PhotoGallery
//
//  Created by alexander.pranevich on 6/16/14.
//  Copyright (c) 2014 Alexander Pronevich. All rights reserved.
//

#import "APSelectSourceTableViewController.h"
#import "APCollectionViewController.h"

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
    [self.navigationController pushViewController:photoGalleryViewController animated:YES];
    
}



@end
