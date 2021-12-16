#import <UIKit/UIKit.h>
#import "ViewController_MainScreen.h"
@import Firebase;


NS_ASSUME_NONNULL_BEGIN

@interface ViewController_RegisterScreen : UIViewController

// Initialise firebase store
@property FIRFirestore *db;

@end

FIRDocumentReference *ref;

NS_ASSUME_NONNULL_END
