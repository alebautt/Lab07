//
//  Home.m
//  Lugares
//
//  Created by Alejandra B on 19/02/15.
//  Copyright (c) 2015 alebautista. All rights reserved.
//

#import "Listas.h"




@interface Listas ()

@end

@implementation Listas
@synthesize tableView;
- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self cfgiAdBanner];
    
    
    
    // Do any additional setup after loading the view.
    /* PFQuery *query =[PFQuery queryWithClassName:@"Lugares"];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        for (id object in objects) {
        NSLog(@"%@",object[@"name"]);
        lblName.text = [tempObject objectForKey:@"name"];
        }
     }];*/

    [self performSelector:@selector(retrieveFromParse)];
}

-(void) retrieveFromParse{
    PFQuery *query =[PFQuery queryWithClassName:@"Lugares"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error)
        {
          arrayLugares = [[NSArray alloc] initWithArray:objects];
        }
        [tableView reloadData];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return arrayLugares.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CellResults";
    CellResults *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    PFObject *tempObject = [arrayLugares objectAtIndex:indexPath.row];
    cell.lblName.text = [tempObject objectForKey:@"name"];
    return cell;
}

-(void) tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Cell seleccionado");
}

- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//__________________Banner__________________

- (void)cfgiAdBanner
{
    // Setup iAdView
    adView = [[ADBannerView alloc] initWithFrame:CGRectZero];
    //Tell the add view the origin depending on iPhone size
    CGRect adFrame      = adView.frame;
    adFrame.origin.y    = self.view.frame.size.height - 50;
    NSLog(@"adFrame.origin.y: %f",adFrame.origin.y);
    adView.frame        = adFrame;
    
    [adView setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    
    [self.view addSubview:adView];
    adView.delegate = self;
    adView.hidden = YES;
    self->bannerIsVisible = NO;
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    if (!self->bannerIsVisible)
    {
        adView.hidden = NO;
        [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
        // banner is invisible now and moved out of the screen on 50 px
        [UIView commitAnimations];
        self->bannerIsVisible = YES;
    }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    if (self->bannerIsVisible)
    {
        [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
        // banner is visible and we move it out of the screen, due to connection issue
        [UIView commitAnimations];
        adView.hidden = YES;
        self->bannerIsVisible = NO;
    }
}

- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave
{
    NSLog(@"Banner view is beginning an ad action");
    BOOL shouldExecuteAction = YES;
    if (!willLeave && shouldExecuteAction)
    {
        // stop all interactive processes in the app
        // [video pause];
        // [audio pause];
    }
    return shouldExecuteAction;
}

- (void)bannerViewActionDidFinish:(ADBannerView *)banner
{
    // resume everything you've stopped
    // [video resume];
    // [audio resume];
}
//___________________________________________


- (IBAction)btnRefresh:(id)sender {
    [self performSelector:@selector(retrieveFromParse)];
    
    [tableView reloadData];
    
}

- (IBAction)button:(id)sender {
 

}
@end
