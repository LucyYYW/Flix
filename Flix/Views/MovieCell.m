//
//  MovieCell.m
//  Flix
//
//  Created by lucyyyw on 6/26/19.
//  Copyright © 2019 lucyyyw. All rights reserved.
//

#import "MovieCell.h"

@implementation MovieCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    UIView *backgroundView = [[UIView alloc] init];
    backgroundView.backgroundColor = [UIColor colorWithRed:0.8 green:0.9 blue:1 alpha:0.8];
    self.selectedBackgroundView = backgroundView;
}

@end
