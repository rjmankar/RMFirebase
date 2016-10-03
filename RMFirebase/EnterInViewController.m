//
//  EnterInViewController.m
//  RMFirebase
//
//  Created by Student P_05 on 27/09/16.
//  Copyright © 2016 Rahul Mankar. All rights reserved.
//

#import "EnterInViewController.h"

@interface EnterInViewController ()

@end

@implementation EnterInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)signOutAction:(id)sender {
    
    
    
    NSError *error;
    [[FIRAuth auth] signOut:&error];
    if (!error) {
        // Sign-out succeeded
        NSLog(@"successfully logged off");
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"OUT" message:@"signout Successfuly" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok=[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            ViewController *goBack=[self.storyboard instantiateViewControllerWithIdentifier:@"mainScreen"];
            
            [self.navigationController pushViewController:goBack animated:YES];
        }];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
        
        
    }
    
}



-(void)whoIsCurrentlySignedIn{
    
    FIRUser *user = [FIRAuth auth].currentUser;
    
    if (user != nil) {
        // User is signed in.
        
        
        
        
    } else {
        // No user is signed in.
    }
    
    
    
}
@end
