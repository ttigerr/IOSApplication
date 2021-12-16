#import <UIKit/UIKit.h>
@import Firebase;
#import "TableViewController_CategoryList.h";

NS_ASSUME_NONNULL_BEGIN

@interface ViewController_BrowseScreen : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource> {
   NSMutableDictionary *categoryItems;
    NSString *onClickedItems;
}
@property (strong, nonatomic) IBOutlet UICollectionView *CollectionView;
@property (strong, nonatomic) IBOutlet UIScrollView *ScrollView;

// Firebase
@property FIRFirestore *db;

@property NSArray *browseImages;
@property NSArray *browseTitle;


@end

NS_ASSUME_NONNULL_END
