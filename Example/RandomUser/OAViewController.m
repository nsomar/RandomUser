//
//  OAViewController.m
//  RandomUser
//
//  Created by Omar Abdelhafith on 12/26/2014.
//  Copyright (c) 2014 Omar Abdelhafith. All rights reserved.
//

#import "OAViewController.h"
#import <OARandomUserService.h>

@interface OAViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userEmailLabel;
@property (weak, nonatomic) IBOutlet UILabel *passwordLabel;
@property (weak, nonatomic) IBOutlet UILabel *fullNameLabel;

@end

@implementation OAViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self requestNewRandomUser];
}

- (void)viewDidLayoutSubviews {
  [super viewDidLayoutSubviews];
  
  self.userImageView.layer.cornerRadius = self.userImageView.frame.size.width / 2.0;
  self.userImageView.clipsToBounds = YES;
}

- (IBAction)newUserTapped:(id)sender {
  [self requestNewRandomUser];
}

- (void)requestNewRandomUser {
  [OARandomUserService requestRandomUser:^(OARandomUser *user) {
    
    //This code should be handled in a better way, it was written like this to save time
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
      NSURL *mediumImageUrl = [NSURL URLWithString:user.picture.medium];
      UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:mediumImageUrl]];
      dispatch_async(dispatch_get_main_queue(), ^{
        self.userImageView.image = image;
      });
    });
    
    self.fullNameLabel.text = [NSString stringWithFormat:@"Full Name: %@ %@ %@", user.name.title, user.name.first, user.name.last];
    self.userNameLabel.text = [NSString stringWithFormat:@"Usr Name: %@", user.username];
    self.passwordLabel.text = [NSString stringWithFormat:@"Password: %@", user.password];
    self.userEmailLabel.text = [NSString stringWithFormat:@"Email: %@", user.email];
    
  }];
}

@end
