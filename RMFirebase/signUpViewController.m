//
//  signUpViewController.m
//  RMFirebase
//
//  Created by Student P_05 on 21/09/16.
//  Copyright © 2016 Rahul Mankar. All rights reserved.
//

#import "signUpViewController.h"

@interface signUpViewController ()

@end

@implementation signUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    UIImage *secondImage=[UIImage imageNamed:@"banner-signup.jpg"];
    
//    [self.view setContentMode:UIViewContentModeScaleAspectFit];
//    [self.view setBackgroundColor:[UIColor colorWithPatternImage:secondImage]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



//-(void)showAlertView




-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [self.emailTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    return YES;
    
}


- (IBAction)signUpAction:(id)sender {
    
    NSString *email=self.emailTextField.text;
    NSString *password=self.passwordTextField.text;
    
    if(email.length >0 && password.length>7)
    {
        
        [[FIRAuth auth]createUserWithEmail:email password:password completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
            
            if (error!=nil) {
                NSLog(@"%@",error.localizedDescription);
            }
            else
            
            
            
            
            
            
            {
                
                if (user!=nil) {
                    
                    [[FIRAuth auth]signInWithEmail:email password:password completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
                        
                        if(error!=nil)
                        {
                            NSLog(@"%@",error.localizedDescription);
                        }
                        else{
                            
                            if(user!=nil)
                            {
                                
                                NSLog(@"Signup Successfully");
                                
                                UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"It's DONE" message:@"Signup Successfully" preferredStyle:UIAlertControllerStyleAlert];
                                UIAlertAction *ok=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                    EnterInViewController *enter=[self.storyboard instantiateViewControllerWithIdentifier:@"EnterInViewController"];
                                    [self.navigationController pushViewController:enter animated:YES];

                                    
                                }];
                                UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"Go Back" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                                    [alert dismissViewControllerAnimated:YES completion:nil];
                                }];
                                
                                [alert addAction:ok];
                                [alert addAction:cancel];
                                
                                [self presentViewController:alert animated:YES completion:nil];
                                
                                
                            }
                            
                        }
                    }];
                }
                
                else{
                    NSLog(@"NO User Unable TosignIN");
                }
            }
            
        }];
        
    }
//    else if (email.length==0)
//    {
//     
//    }







}



@end
