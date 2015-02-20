//
//  Home.h
//  Lugares
//
//  Created by Alejandra B on 19/02/15.
//  Copyright (c) 2015 alebautista. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <iAd/iAd.h>
#import "CellResults.h"

@interface Home : UIViewController
<UIAccelerometerDelegate, UITableViewDelegate>
{
    NSArray *arrayLugares;
    
    ADBannerView *adView;
    BOOL bannerIsVisible;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
