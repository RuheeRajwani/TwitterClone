//
//  ComposeViewController.m
//  twitter
//
//  Created by Ruhee Rajwani on 6/22/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"

@interface ComposeViewController ()

@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;

@end

@implementation ComposeViewController
- (IBAction)closeTapped:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}
- (IBAction)sendTweetTapped:(id)sender {
    [[APIManager shared] postStatusWithText:self.tweetTextView.text completion:^(Tweet *tweet, NSError *error) {
        if(error){
            NSLog(@"Error composing Tweet: %@", error.localizedDescription);
        }else{
            [self.delegate didTweet:tweet];
            [self dismissViewControllerAnimated:true completion:nil];
            NSLog(@"successfully composed tweet");
        }
    }];
    
}

@end
