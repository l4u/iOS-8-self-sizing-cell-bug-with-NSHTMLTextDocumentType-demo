//
//  TableViewCell.m
//  self sizing demo
//
//  Created by Leo on 10/3/14.
//  Copyright (c) 2014 Cursorless Limited. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell ()

@property (nonatomic, assign) BOOL didSetupConstraints;

@end

@implementation TableViewCell

- (CGFloat)randomZeroToOne
{
    double upper_bound = 256.0;
    return arc4random_uniform(upper_bound)/upper_bound;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.clipsToBounds = YES;
        [self setBackgroundColor:[UIColor colorWithRed:self.randomZeroToOne green:self.randomZeroToOne blue:self.randomZeroToOne alpha:0.2]];
        [self.contentView setBackgroundColor:[UIColor colorWithRed:self.randomZeroToOne green:self.randomZeroToOne blue:self.randomZeroToOne alpha:0.2]];
        self.titleLabel = [UILabel new];
        [self.titleLabel setBackgroundColor:[UIColor clearColor]];
        [self.titleLabel setNumberOfLines:0];
        [self.titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
        [self.contentView addSubview:self.titleLabel];
    }

    return self;
}

- (void)updateConstraints {
    UIView *superview = self.contentView;
    UIEdgeInsets padding = UIEdgeInsetsMake(10, 10, 10, 10);

    if (!self.didSetupConstraints) {

        [superview addConstraints:@[

                //view1 constraints
                [NSLayoutConstraint constraintWithItem:self.titleLabel
                                             attribute:NSLayoutAttributeTop
                                             relatedBy:NSLayoutRelationEqual
                                                toItem:superview
                                             attribute:NSLayoutAttributeTop
                                            multiplier:1.0
                                              constant:padding.top],

                [NSLayoutConstraint constraintWithItem:self.titleLabel
                                             attribute:NSLayoutAttributeLeft
                                             relatedBy:NSLayoutRelationEqual
                                                toItem:superview
                                             attribute:NSLayoutAttributeLeft
                                            multiplier:1.0
                                              constant:padding.left],

                [NSLayoutConstraint constraintWithItem:self.titleLabel
                                             attribute:NSLayoutAttributeBottom
                                             relatedBy:NSLayoutRelationEqual
                                                toItem:superview
                                             attribute:NSLayoutAttributeBottom
                                            multiplier:1.0
                                              constant:-padding.bottom],

                [NSLayoutConstraint constraintWithItem:self.titleLabel
                                             attribute:NSLayoutAttributeRight
                                             relatedBy:NSLayoutRelationEqual
                                                toItem:superview
                                             attribute:NSLayoutAttributeRight
                                            multiplier:1
                                              constant:-padding.right],

        ]];
        self.didSetupConstraints = YES;
    }

    [super updateConstraints];
}

@end
