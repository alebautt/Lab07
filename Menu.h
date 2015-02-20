//
//  menuViewController.h
//  Lugares
//
//  Created by Alejandra B on 19/02/15.
//  Copyright (c) 2015 alebautista. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>


@interface Menu : UIViewController
<UIAccelerometerDelegate>
{
    ADBannerView *adView;
    BOOL bannerIsVisible;
}


@end
