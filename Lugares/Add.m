//
//  ViewController.m
//  Lugares
//
//  Created by Alejandra B on 19/02/15.
//  Copyright (c) 2015 alebautista. All rights reserved.
//

#import "Add.h"

@interface Add ()

@end

@implementation Add

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSave:(id)sender {
//envio datos a mi clase en parse
    PFObject *testObject = [PFObject objectWithClassName:@"Lugares"];
    testObject[@"name"] = self.txtName.text;
    testObject[@"latitude"] = self.txtLatitude.text;
    testObject[@"longitude"] = self.txtLongitude.text;
    testObject[@"url"] = self.txtUrl.text;
    testObject[@"time"] = self.txtTime.text;
    if([testObject saveInBackground]){
        NSLog(@"Se ha guardado correctamente el registro en parse");
    }
}

@end
