
#import "ViewController_AddEvent.h"

@interface ViewController_AddEvent ()
@property (strong, nonatomic) IBOutlet UITextField *eventName;
@property (strong, nonatomic) IBOutlet UITextField *eventDate;
@property (strong, nonatomic) IBOutlet UITextField *eventTime;
@property (strong, nonatomic) IBOutlet UITextField *eventPlace;
@property (strong, nonatomic) IBOutlet UITextField *eventDescription;


@end

@implementation ViewController_AddEvent
@synthesize ScrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
    _db = [FIRFirestore firestore];
    [ScrollView setScrollEnabled:YES];
    [ScrollView setContentSize:CGSizeMake(375, 700)];
}
- (IBAction)saveMethod:(id)sender {
    
    NSString *eName = _eventName.text;
    NSString *eDate =  _eventDate.text;
    NSString *eTime =  _eventTime.text;
    NSString *ePlace = _eventPlace.text;
    NSString *eDescription = _eventDescription.text;

 
    FIRDocumentReference *ref =
        [[self.db collectionWithPath:@"userEvents"] addDocumentWithData:@{
            @"name": eName,
            @"date": eDate,
            @"time": eTime,
            @"place": ePlace,
            @"description": eDescription,
        }];
    
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];

}



@end
