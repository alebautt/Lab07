//
//  ViewController.h
//  Lugares
//
//  Created by Alejandra B on 20/02/15.
//  Copyright (c) 2015 alebautista. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <CoreLocation/CoreLocation.h>
#import <googlemaps/googlemaps.h>



@interface Maps : UIViewController <CLLocationManagerDelegate, GMSMapViewDelegate>
    
@property (strong, nonatomic) IBOutlet GMSMapView *view;

@end
