#import "ViewController_RegisterScreen.h"

@interface ViewController_RegisterScreen ()
@property (strong, nonatomic) IBOutlet UITextField *registeredEmail;
@property (strong, nonatomic) IBOutlet UITextField *registeredPassword;
@property (strong, nonatomic) IBOutlet UITextField *registeredName;

@end

@implementation ViewController_RegisterScreen


- (void)viewDidLoad {
    [super viewDidLoad];
    _db = [FIRFirestore firestore];
    
}

// Create new users
- (IBAction)registerMethod:(id)sender {
    NSString *newUserName = _registeredName.text;
    NSString *newUserEmail = _registeredEmail.text;
    NSString *newUserPassword = _registeredPassword.text;
    
    [[FIRAuth auth] createUserWithEmail: newUserEmail password:newUserPassword completion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error) {
        if ( authResult != nil) {
            
            // Store users information
            __block FIRDocumentReference *ref =
                [[self.db collectionWithPath:@"users"] addDocumentWithData:@{
                  @"name": newUserName,
                  @"email": newUserEmail
                } completion:^(NSError * _Nullable error) {
                    if (error != nil) {
                      NSLog(@"Error adding document: %@", error);
                    } else {
                      NSLog(@"Document added with ID: %@", ref.documentID);
                    }
                }];
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            ViewController_MainScreen *mainScreen = [sb instantiateViewControllerWithIdentifier:@"ViewController_MainScreen"];
            [self presentViewController:mainScreen animated:YES completion:nil];
            NSLog(@"Loggin Successfully");
        }
        else {
            NSLog(@"Loggin fail");
        }
    }];
    
   
}



@end
