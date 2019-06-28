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
    
    //NSLog(@"didload");
    // Do any additional setup after loading the view.
    
    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
    NSString *posterURLString = self.movie[@"poster_path"];
    
    NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
    NSURL *posterURL = [NSURL URLWithString:fullPosterURLString];
    [self.posterView setImageWithURL:posterURL];
    
    
    
    
    
    
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
