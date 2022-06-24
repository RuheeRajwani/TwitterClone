//
//  DetailsViewController.m
//  twitter
//
//  Created by Ruhee Rajwani on 6/23/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *fullName;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *tweetText;
@property (weak, nonatomic) IBOutlet UILabel *likeValue;
@property (weak, nonatomic) IBOutlet UILabel *retweetValue;

@end

@implementation DetailsViewController
- (IBAction)retweetTapped:(id)sender {
    NSLog(@"retweet");
}
- (IBAction)favoriteTapped:(id)sender {
    NSLog(@"favorite");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fullName.text = self.tweet.user.name;
    self.username.text = self.tweet.user.screenName;
    self.date.text= self.tweet.createdAtString;
    self.tweetText.text = self.tweet.text;
    
    self.retweetValue.text=[NSString stringWithFormat:@"%d", self.tweet.retweetCount];
    self.likeValue.text = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
    
    NSString *URLString = self.tweet.user.profilePicture;
    NSURL *url = [NSURL URLWithString:URLString];
    [self.profileImage setImageWithURL:url];
    
    self.profileImage.layer.cornerRadius = self.profileImage.frame.size.height /2;
    self.profileImage.layer.masksToBounds = YES;
    self.profileImage.layer.borderWidth = 0;
        
}

@end
