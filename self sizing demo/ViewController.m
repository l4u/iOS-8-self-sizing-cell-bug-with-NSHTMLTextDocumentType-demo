//
//  ViewController.m
//  self sizing demo
//
//  Created by Leo on 10/3/14.
//  Copyright (c) 2014 Cursorless Limited. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.4];

    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44.0; // set this to whatever your "average" cell height is; it doesn't need to be very accurate
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (!cell) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    ((TableViewCell *)cell).titleLabel.text = [self randomStringWithLength:arc4random_uniform(200)];

    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 ";

- (NSString *)randomStringWithLength:(int)len{

    NSMutableString *randomString = [NSMutableString stringWithCapacity:len];

    for (int i = 0; i < len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform([letters length]) % [letters length]]];
    }

    return randomString;
}
@end
