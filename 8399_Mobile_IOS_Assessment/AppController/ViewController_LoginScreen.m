#import "ViewController_LoginScreen.h"

@interface ViewController_LoginScreen ()
@property (strong, nonatomic) IBOutlet UITextField *loginEmail;
@property (strong, nonatomic) IBOutlet UITextField *loginPassword;

@end

@implementation ViewController_LoginScreen

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)loginMethod:(id)sender {
    NSString *userEmail = _loginEmail.text;
    NSString *userPassword = _loginPassword.text;
    
    [[FIRAuth auth] signInWithEmail:userEmail password:userPassword completion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error) {
        if(authResult != nil){
            
            // Check the authentication from users
            if([FIRAuth auth].currentUser){
                UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                ViewController_MainScreen *mainScreen = [sb instantiateViewControllerWithIdentifier:@"ViewController_MainScreen"];
                [self presentViewController:mainScreen animated:YES completion:nil];
                
                
                //[self performSegueWithIdentifier:@"LoginSegue" sender:sender];

            }
 
        }
        else{
            
            // Send the alert message to users on the screen when users entered invalid input
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error"
                                                                                     message:@"Invalid Email or Password!!"
                                                                              preferredStyle:UIAlertControllerStyleAlert];
            //Add buttons to the alert controller by creating UIAlertActions:
            UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok"
                                                               style:UIAlertActionStyleDefault
                                                             handler:nil];
            [alertController addAction:actionOk];
            [self presentViewController:alertController animated:YES completion:nil];
            NSLog(@"Loggin fail");
        }
    }];

}


@end
