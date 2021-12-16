#import <UIKit/UIKit.h>
#import "ViewController_homeScreen.h";
@import Firebase;

NS_ASSUME_NONNULL_BEGIN

@interface ViewController_ProfileScreen : UIViewController {
    NSMutableArray *userTitle;
    NSMutableArray *userDetails;
}
@property (strong, nonatomic) IBOutlet UIScrollView *ScrollView;

@end

NS_ASSUME_NONNULL_END
