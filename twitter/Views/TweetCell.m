//
//  TweetCell.m
//  twitter
//
//  Created by Ruhee Rajwani on 6/21/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "APIManager.h"
#import "UIImageView+AFNetworking.h"


@implementation TweetCell
- (IBAction)didTapRetweet:(id)sender {
    if(!self.tweet.retweeted){
        self.tweet.retweeted = YES;
        self.tweet.retweetCount += 1;
        [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                 NSLog(@"Error retweeting the tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully retweeted the following Tweet: %@", tweet.text);
            }
        }];
    } else {
        self.tweet.retweeted = NO;
        self.tweet.retweetCount -= 1;
        [[APIManager shared] unretweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                 NSLog(@"Error unretweeting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully unretweeted the following Tweet: %@", tweet.text);
            }
        }];
        
    }
    [self refreshRetweeted];
}
- (IBAction)didTapFavorite:(id)sender {
    //Update the local tweet model
    if(!self.tweet.favorited){
        self.tweet.favorited = YES;
        self.tweet.favoriteCount += 1;
        [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                 NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
            }
        }];
    } else {
        self.tweet.favorited = NO;
        self.tweet.favoriteCount -= 1;
        [[APIManager shared] unfavorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                 NSLog(@"Error unfavoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully unfavorited the following Tweet: %@", tweet.text);
            }
        }];
        
    }
    [self refreshFavorited];
    
}

-(void) setTweet:(Tweet *)tweet{
    _tweet=tweet;
    
    [self refreshFavorited];
    [self refreshRetweeted];
    
    self.tweetText.text = self.tweet.text;

    
    self.username.text= self.tweet.user.screenName;
    self.name.text=  self.tweet.user.name;
    self.date.text=self.tweet.createdAtString;
    NSString *URLString = self.tweet.user.profilePicture;
    NSURL *url = [NSURL URLWithString:URLString];
    [self.profileImage setImageWithURL:url];
    
    self.profileImage.layer.cornerRadius = self.profileImage.frame.size.height /2;
    self.profileImage.layer.masksToBounds = YES;
    self.profileImage.layer.borderWidth = 0;
    
}

-(void) refreshFavorited {
    self.likeValue.text = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
    if(self.tweet.favorited){
        [self.like setImage:[UIImage imageNamed:@"favor-icon-red"] forState:UIControlStateNormal];
    }else{
        [self.like setImage:[UIImage imageNamed:@"favor-icon"] forState:UIControlStateNormal];
    }
}

-(void) refreshRetweeted {
    self.retweetValue.text = [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
    if(self.tweet.retweeted){
        [self.retweet setImage:[UIImage imageNamed:@"retweet-icon-green"] forState:UIControlStateNormal];
    }else{
        [self.retweet setImage:[UIImage imageNamed:@"retweet-icon"] forState:UIControlStateNormal];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
