//
//  signUpViewController.h
//  RMFirebase
//
//  Created by Student P_05 on 21/09/16.
//  Copyright © 2016 Rahul Mankar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FirebaseAuth/FirebaseAuth.h>
#import "EnterInViewController.h"

@interface signUpViewController : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
- (IBAction)signUpAction:(id)sender;

@end
