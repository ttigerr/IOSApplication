
#import "ViewController_MainScreen.h"

@interface ViewController_MainScreen ()

@end

@implementation ViewController_MainScreen

@synthesize ScrollView;
@synthesize suggestCollectionView;
@synthesize todayCollectionView;
@synthesize tomorrowCollectionView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _db = [FIRFirestore firestore];
    [ScrollView setScrollEnabled:YES];
    [ScrollView setContentSize:CGSizeMake(375, 900)];
    
    // Read the data from Firebase for suggestion part
    suggestedEventItems = [[NSMutableDictionary alloc]initWithCapacity:5];
    
    [[self.db collectionWithPath:@"suggestionEvents"]
        getDocumentsWithCompletion:^(FIRQuerySnapshot *snapshot, NSError *error) {
          if (error != nil) {
            NSLog(@"Error getting documents: %@", error);
          } else {
            for (FIRDocumentSnapshot *document in snapshot.documents) {
                NSString *key = document.documentID;
                NSDictionary *eventDetail = document.data;
                [self -> suggestedEventItems setObject:eventDetail forKey:key];
            }
              NSLog(@"self -> categoryItems = %@", self -> suggestedEventItems);
              [self.suggestCollectionView reloadData];
          }
        }];
    
    // Read the data from Firebase for today part
    todayEventItems = [[NSMutableDictionary alloc]initWithCapacity:5];
    
    [[self.db collectionWithPath:@"todayEvents"]
        getDocumentsWithCompletion:^(FIRQuerySnapshot *snapshot, NSError *error) {
          if (error != nil) {
            NSLog(@"Error getting documents: %@", error);
          } else {
            for (FIRDocumentSnapshot *document in snapshot.documents) {
                NSString *key = document.documentID;
                NSDictionary *eventDetail = document.data;
                [self -> todayEventItems setObject:eventDetail forKey:key];
            }
              NSLog(@"self -> categoryItems = %@", self -> todayEventItems);
              [self.todayCollectionView reloadData];
          }
        }];
    
    // Read the data from Firebase for tomorrow part
    tomorrowEventItems = [[NSMutableDictionary alloc]initWithCapacity:5];
    
    [[self.db collectionWithPath:@"tomorrowEvents"]
        getDocumentsWithCompletion:^(FIRQuerySnapshot *snapshot, NSError *error) {
          if (error != nil) {
            NSLog(@"Error getting documents: %@", error);
          } else {
            for (FIRDocumentSnapshot *document in snapshot.documents) {
                NSString *key = document.documentID;
                NSDictionary *eventDetail = document.data;
                [self -> tomorrowEventItems setObject:eventDetail forKey:key];
            }
              NSLog(@"self -> categoryItems = %@", self -> tomorrowEventItems);
              [self.tomorrowCollectionView reloadData];
          }
        }];

    // Declare the images in arrays
    // suggestions
    _suggestEventImages = [[NSArray alloc]initWithObjects:@"event1", @"event4",@"event2", @"event3", nil];
    
    // Today
    _todayEventImages = [[NSArray alloc]initWithObjects:@"today3", @"today1",@"today4", @"today2", nil];
    
    // Tomorrow
    _tomorrowEventImages = [[NSArray alloc]initWithObjects:@"tday3", @"today4",@"today3", @"today2", nil];
}

// The collectionView Horizontal scroll
- (UICollectionViewCell *)collectionView:( UICollectionView *)collectionView cellForItemAtIndexPath:( NSIndexPath *)indexPath {
    UICollectionViewCell *cellId = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath ];
    
    // for the suggestion parts
    UIImageView *imageView = (UIImageView *)[cellId viewWithTag:10];
    UILabel *title = (UILabel *)[cellId viewWithTag:20];
    
    NSString *suggestItemNo = [suggestedEventItems allKeys][indexPath.row];
    NSString *suggestName = suggestedEventItems[suggestItemNo][@"name"];
    
    imageView.image = [UIImage imageNamed:[_suggestEventImages objectAtIndex:indexPath.row]];
    title.text = suggestName;
    
    // for the today parts
    UIImageView *todayEventImage = (UIImageView *)[cellId viewWithTag:30];
    UILabel *todayEventName = (UILabel *)[cellId viewWithTag:40];
    UILabel *todayEventDate = (UILabel *)[cellId viewWithTag:50];
    
    NSString *todayItemNo = [todayEventItems allKeys][indexPath.row];
    NSString *todayName = todayEventItems[todayItemNo][@"name"];
    NSString *todayDate = todayEventItems[todayItemNo][@"date"];
    
    todayEventImage.image = [UIImage imageNamed:[_todayEventImages objectAtIndex:indexPath.row]];
    todayEventName.text = todayName;
    todayEventDate.text = todayDate;
    
    // for the today parts
    UIImageView *tomorrowEventImage = (UIImageView *)[cellId viewWithTag:60];
    UILabel *tomorrowEventName = (UILabel *)[cellId viewWithTag:70];
    UILabel *tomorrowEventDate = (UILabel *)[cellId viewWithTag:80];
    
    NSString *tomorrowItemNo = [tomorrowEventItems allKeys][indexPath.row];
    NSString *tomorrowName = tomorrowEventItems[tomorrowItemNo][@"name"];
    NSString *tomorrowDate = tomorrowEventItems[tomorrowItemNo][@"date"];
    
    tomorrowEventImage.image = [UIImage imageNamed:[_tomorrowEventImages objectAtIndex:indexPath.row]];
    tomorrowEventName.text = tomorrowName;
    tomorrowEventDate.text = tomorrowDate;
    
    return cellId;
}


- (NSInteger)collectionView:( UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [suggestedEventItems count];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}



@end
