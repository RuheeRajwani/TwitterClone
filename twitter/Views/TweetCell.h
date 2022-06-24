//
//  TweetCell.h
//  twitter
//
//  Created by Ruhee Rajwani on 6/21/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

NS_ASSUME_NONNULL_BEGIN

@interface TweetCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *tweetText;
@property (weak, nonatomic) IBOutlet UILabel *retweetValue;
@property (weak, nonatomic) IBOutlet UILabel *likeValue;
@property (weak, nonatomic) IBOutlet UIButton *reply;
@property (weak, nonatomic) IBOutlet UIButton *retweet;
@property (weak, nonatomic) IBOutlet UIButton *like;
@property (weak, nonatomic) IBOutlet UIButton *message;
@property (strong, nonatomic) Tweet *tweet;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;




@end

NS_ASSUME_NONNULL_END
