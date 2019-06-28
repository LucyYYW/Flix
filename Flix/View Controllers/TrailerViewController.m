//
//  TrailerViewController.m
//  Flix
//
//  Created by lucyyyw on 6/27/19.
//  Copyright © 2019 lucyyyw. All rights reserved.
//

#import "TrailerViewController.h"
#import <WebKit/WebKit.h>

@interface TrailerViewController ()
@property (weak, nonatomic) IBOutlet WKWebView *trailerWebView;

@end

@implementation TrailerViewController


- (void) viewDidLoad {
    
    [super viewDidLoad];
    
    
    NSString *trailerURL = [NSString stringWithFormat:@"https://api.themoviedb.org/3/movie/%@/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US]", self.movie[@"id"]];
    
    
    
    NSURL *url = [NSURL URLWithString:trailerURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error != nil) {
            NSLog(@"%@", [error localizedDescription]);
        }
        else {
            NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSArray *a = dataDictionary[@"results"];
            NSDictionary *b = a[0];
            NSString *skey = b[@"key"];
            NSString *baseURLString = @"https://www.youtube.com/watch?v=";
            self.videoKey = [baseURLString stringByAppendingString:skey];
            
            // Convert the url String to a NSURL object.
            NSURL *videourl = [NSURL URLWithString:self.videoKey];
            
            
            
            // Place the URL in a URL Request.
            NSURLRequest *request = [NSURLRequest requestWithURL:videourl
                                                     cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                 timeoutInterval:10.0];
            // Load Request into WebView.
            [self.trailerWebView loadRequest:request];
            
        }
    }];
    [task resume];
}


- (IBAction)onButtonPressed:(UIButton *)sender {
    NSLog(@"Button pressed!");
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
