@import Firebase;
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewController_MainScreen : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource> {
    NSMutableDictionary *suggestedEventItems;
    NSMutableDictionary *todayEventItems;
    NSMutableDictionary *tomorrowEventItems;
}
@property (strong, nonatomic) IBOutlet UIScrollView *ScrollView;
@property (strong, nonatomic) IBOutlet UICollectionView *suggestCollectionView;
@property (strong, nonatomic) IBOutlet UICollectionView *todayCollectionView;
@property (strong, nonatomic) IBOutlet UICollectionView *tomorrowCollectionView;

// Firebase
@property FIRFirestore *db;

// Item arrays for suggestion
@property NSArray *suggestEventNames;
@property NSArray *suggestEventImages;

// Item arrays for suggestion
@property NSArray *todayEventNames;
@property NSArray *todayEventImages;
@property NSArray *todayEventDates;
// Item arrays for suggestion
@property NSArray *tomorrowEventNames;
@property NSArray *tomorrowEventImages;
@property NSArray *tomorrowEventDates;
@end

NS_ASSUME_NONNULL_END
