//
//  ViewController.m
//  RMFirebase
//
//  Created by Student P_03 on 20/09/16.
//  Copyright © 2016 Rahul Mankar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.m
    
//    UIImage *firstImage=[UIImage imageNamed:@"nature.jpg"];
//    [self.view setContentMode:UIViewContentModeScaleAspectFit];
//    self.view.backgroundColor=[UIColor colorWithPatternImage:firstImage];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [self.emailTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    return YES;
    
}



-(void)pushToAnotherViewMethod{
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"It's DONE" message:@"SignIn Successfully" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        EnterInViewController *enter=[self.storyboard instantiateViewControllerWithIdentifier:@"EnterInViewController"];
        [self.navigationController pushViewController:enter animated:YES];
        
        
    }];
    
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
    
    
}

- (IBAction)loginButtonAction:(id)sender {
    

       NSString *email=self.emailTextField.text;
       NSString *password=self.passwordTextField.text;
       
       if (email.length > 0) {
           
           if (password.length > 0) {
               
               [[FIRAuth auth]signInWithEmail:email password:password completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
               
                   if(error!=nil)
                   {
                       NSLog(@"%@",error.localizedDescription);
                   }
                   else{
                       
                       if(user!=nil)
                       {
                           
                           NSLog(@"SignIn Successfully");
                           
                           [self pushToAnotherViewMethod];
                           
                           
                       }
                       
               
                   }
               }];
           }
           else {
               //alert for no password
               UIAlertController *alertForEmptyField=[UIAlertController alertControllerWithTitle:@"password field is empty" message:@"please enter password" preferredStyle:UIAlertControllerStyleAlert];
               UIAlertAction *ok=[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                   [alertForEmptyField dismissViewControllerAnimated:YES completion:nil];
               }];
               [self presentViewController:alertForEmptyField animated:YES completion:nil];
               [alertForEmptyField addAction:ok];
           }
       }
       else {
           //alert for no email
           UIAlertController *alertForEmptyField=[UIAlertController alertControllerWithTitle:@"email field is empty" message:@"please enter email" preferredStyle:UIAlertControllerStyleAlert];
           UIAlertAction *ok=[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
               [alertForEmptyField dismissViewControllerAnimated:YES completion:nil];
           }];
           [alertForEmptyField addAction:ok];
           
           [self presentViewController:alertForEmptyField animated:YES completion:nil];
       }
       
       }

@end
