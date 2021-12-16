//
//  ViewController_listScreen.h
//  8399_Mobile_IOS_Assessment
//
//  Created by  visanoukan CHALERNPHON on 18/11/2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewController_listScreen : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *myTableView;

@end

NS_ASSUME_NONNULL_END
