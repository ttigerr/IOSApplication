#import "ViewController_AddEvent.h"
#import "ViewController_EventContentScreen.h"
#import <UIKit/UIKit.h>
@import Firebase;

NS_ASSUME_NONNULL_BEGIN

@interface ViewController_MyListScreen : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSMutableArray *eventImageNames;
    NSMutableArray *eventNames;
    NSMutableArray *eventDetails;
    NSMutableArray *eventDate;
    NSMutableDictionary *objectListOfUserEvents;
}

@property NSString *objectSelected;
@property FIRFirestore *db;

@end

NS_ASSUME_NONNULL_END
