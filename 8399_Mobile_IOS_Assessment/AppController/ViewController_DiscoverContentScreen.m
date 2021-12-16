//
//  ViewController_DiscoverContentScreen.m
//  8399_Mobile_IOS_Assessment
//
//  Created by  visanoukan CHALERNPHON on 22/11/2021.
//

#import "ViewController_DiscoverContentScreen.h"

@interface ViewController_DiscoverContentScreen ()

@end

@implementation ViewController_DiscoverContentScreen
@synthesize ScrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Create the scroll view
    [ScrollView setScrollEnabled:YES];
    [ScrollView setContentSize:CGSizeMake(375, 900)];
}


@end
