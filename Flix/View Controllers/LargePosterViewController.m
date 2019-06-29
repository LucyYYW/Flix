//
//  LargePosterViewController.m
//  Flix
//
//  Created by lucyyyw on 6/27/19.
//  Copyright © 2019 lucyyyw. All rights reserved.
//

#import "LargePosterViewController.h"
#import "UIImageView+AFNetworking.h"

@interface LargePosterViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *posterView;

@end

@implementation LargePosterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSString *baseSmallURLString = @"https://image.tmdb.org/t/p/w45";
    NSString *posterSmallURLString = self.movie[@"poster_path"];
    
    NSString *fullPosterSmallURLString = [baseSmallURLString stringByAppendingString:posterSmallURLString];
    
    NSString *baseLargeURLString = @"https://image.tmdb.org/t/p/original";
    NSString *posterLargeURLString = self.movie[@"poster_path"];
    
    NSString *fullPosterLargeURLString = [baseLargeURLString stringByAppendingString:posterLargeURLString];
    
    
    
    
    
    NSURL *urlSmall = [NSURL URLWithString:fullPosterSmallURLString];
    NSURL *urlLarge = [NSURL URLWithString:fullPosterLargeURLString];
    
    NSURLRequest *requestSmall = [NSURLRequest requestWithURL:urlSmall];
    NSURLRequest *requestLarge = [NSURLRequest requestWithURL:urlLarge];
    
    __weak LargePosterViewController *weakSelf = self;
    
    [self.posterView setImageWithURLRequest:requestSmall
                          placeholderImage:nil
                                   success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *smallImage) {
                                       
                                       // smallImageResponse will be nil if the smallImage is already available
                                       // in cache (might want to do something smarter in that case).
                                       weakSelf.posterView.alpha = 0.0;
                                       weakSelf.posterView.image = smallImage;
                                       
                                       [UIView animateWithDuration:0.3
                                                        animations:^{
                                                            
                                                            weakSelf.posterView.alpha = 1.0;
                                                            
                                                        } completion:^(BOOL finished) {
                                                            // The AFNetworking ImageView Category only allows one request to be sent at a time
                                                            // per ImageView. This code must be in the completion block.
                                                            [weakSelf.posterView setImageWithURLRequest:requestLarge
                                                                                      placeholderImage:smallImage
                                                                                               success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage * largeImage) {
                                                                                                   weakSelf.posterView.image = largeImage;
                                                                                               }
                                                                                               failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                                                                                   // do something for the failure condition of the large image request
                                                                                                   // possibly setting the ImageView's image to a default image
                                                                                               }];
                                                        }];
                                   }
                                   failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                       // do something for the failure condition
                                       // possibly try to get the large image
                                   }];
    
    
    
}
- (IBAction)onButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
