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

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.4]];
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
