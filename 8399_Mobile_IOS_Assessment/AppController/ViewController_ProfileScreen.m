
#import "ViewController_ProfileScreen.h"

@interface ViewController_ProfileScreen ()
@property (strong, nonatomic) IBOutlet UITableView *UserInfoTableViews;

@end

@implementation ViewController_ProfileScreen
@synthesize ScrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [ScrollView setScrollEnabled:YES];
    [ScrollView setContentSize:CGSizeMake(375, 900)];
    
    userTitle = [NSMutableArray arrayWithArray:@[@"Fullname", @"Username", @"Email Address", @"Password"]];
    userDetails = [NSMutableArray arrayWithArray:@[@"Kim Jennie", @"Jennie2021", @"Jennie@user.com", @"Password"]];
}

- (NSInteger)tableView:( UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return userTitle.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    cell.textLabel.text = userTitle[indexPath.row];
    cell.detailTextLabel.text = userDetails[indexPath.row];
    
    return cell;
}
- (IBAction)logoutMethod:(id)sender {
    NSError *signOutError;
    BOOL status = [[FIRAuth auth] signOut:&signOutError];
    if (!status) {
      NSLog(@"Error signing out: %@", signOutError);
      return;
    }
    else {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ViewController_homeScreen *mainScreen = [sb instantiateViewControllerWithIdentifier:@"ViewController_homeScreen"];
        [self presentViewController:mainScreen animated:YES completion:nil];
        return;
    }
}

@end
