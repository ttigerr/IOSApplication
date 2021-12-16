
#import "ViewController_EventContentScreen.h"
#import "ViewController_MyListScreen.h"

@interface ViewController_EventContentScreen ()
@property (weak, nonatomic) IBOutlet UILabel *eventTime;
@property (weak, nonatomic) IBOutlet UILabel *eventDate;
@property (weak, nonatomic) IBOutlet UILabel *eventPlace;

@end

@implementation ViewController_EventContentScreen
@synthesize ScrollView_Content;

- (void)viewDidLoad {
    [super viewDidLoad];
    [ScrollView_Content setScrollEnabled:YES];
    [ScrollView_Content setContentSize:CGSizeMake(375, 900)];
        
    eventImageDictionary = @{
        @"Ultra Festival 2021" : @"image1",
    };
}

@end
