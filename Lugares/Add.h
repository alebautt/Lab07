//
//  ViewController.h
//  Lugares
//
//  Created by Alejandra B on 19/02/15.
//  Copyright (c) 2015 alebautista. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>


@interface Add : UIViewController

- (IBAction)btnSave:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (strong, nonatomic) IBOutlet UITextField *txtLatitude;
@property (strong, nonatomic) IBOutlet UITextField *txtLongitude;

@property (strong, nonatomic) IBOutlet UITextField *txtUrl;
@property (strong, nonatomic) IBOutlet UITextField *txtTime;
@end

