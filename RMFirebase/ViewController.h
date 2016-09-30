//
//  ViewController.h
//  RMFirebase
//
//  Created by Student P_03 on 20/09/16.
//  Copyright © 2016 Rahul Mankar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FirebaseAuth/FirebaseAuth.h>
#import "signUpViewController.h"

@interface ViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *emailTextField;

@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;


- (IBAction)loginButtonAction:(id)sender;






@end

