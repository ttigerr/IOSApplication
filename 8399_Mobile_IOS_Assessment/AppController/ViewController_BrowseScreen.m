#import "ViewController_BrowseScreen.h"

@interface ViewController_BrowseScreen ()

@end

@implementation ViewController_BrowseScreen
@synthesize CollectionView;
@synthesize ScrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
    _db = [FIRFirestore firestore];
    _browseImages = [[NSArray alloc]initWithObjects:@"category1",@"nightlife",@"workshop",@"concert",@"category3",@"category2",nil];
    
     //allocated memory
    categoryItems = [[NSMutableDictionary alloc]initWithCapacity:5];
    
    // Read the data from Firebase
    [[self.db collectionWithPath:@"categories"]
        getDocumentsWithCompletion:^(FIRQuerySnapshot *snapshot, NSError *error) {
          if (error != nil) {
            NSLog(@"Error getting documents: %@", error);
          } else {
            for (FIRDocumentSnapshot *document in snapshot.documents) {
                NSString *key = document.documentID;
                NSDictionary *eventDetail = document.data;
                [self -> categoryItems setObject:eventDetail forKey:key];
            }
              NSLog(@"self -> categoryItems = %@", self -> categoryItems);
              [self.CollectionView reloadData];
          }
        }];
    
    // Set up the scrollview
    [ScrollView setScrollEnabled:YES];
    [ScrollView setContentSize:CGSizeMake(375, 900)];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [categoryItems count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cellId = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath ];
    UIImageView *imageView = (UIImageView *)[cellId viewWithTag:10];
    UILabel *title = (UILabel *)[cellId viewWithTag:20];
    
    //NSString *titleLabel = title.text;
    //NSString *imageView2 = imageView.image;
    
    NSString *categories = [categoryItems allKeys][indexPath.row];
    NSString *eventName = categoryItems[categories][@"category"];
//    NSString *eventCategory = categoryItems[categories][@"category"];
//    NSString *eventDate = categoryItems[categories][@"date"];
//    NSString *eventImage = categoryItems[categories][@"image"];
//
//    NSMutableString *eventDetail = [[NSMutableString alloc]init];
//    [eventDetail appendString:eventCategory];
    
    imageView.image = [UIImage imageNamed:[_browseImages objectAtIndex:indexPath.row]];
    title.text = eventName;
    
    //imageView2 = eventImage;
    //titleLabel = eventDetail;

    return cellId;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TableViewController_CategoryList *categoryScreen = [sb instantiateViewControllerWithIdentifier:@"TableViewController_CategoryList"];
    
    [self presentViewController:categoryScreen animated:YES completion:nil];
}



//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//    return 2;
//}

// Search method

@end
