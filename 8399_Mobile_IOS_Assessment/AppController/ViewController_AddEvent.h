#import <UIKit/UIKit.h>
#import "ViewController_MyListScreen.h"
@import Firebase;

NS_ASSUME_NONNULL_BEGIN


@interface ViewController_AddEvent : UIViewController
@property (strong, nonatomic) IBOutlet UIScrollView *ScrollView;

@property FIRFirestore *db;


@end

NS_ASSUME_NONNULL_END
