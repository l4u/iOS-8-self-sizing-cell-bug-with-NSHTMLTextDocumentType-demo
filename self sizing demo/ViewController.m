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
    self.longOrShort = [NSMutableArray new];
    for (NSUInteger i = 0; i < 20; i++) {
        self.longOrShort[i] = @(NO);
    }

    self.tableView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.4];
    [self.tableView registerClass:TableViewCell.class forCellReuseIdentifier:@"CellReuse"];

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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellReuse" forIndexPath:indexPath];

    if (!cell) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellReuse"];
    }

    self.longOrShort[indexPath.row] = @(!(((NSNumber*)self.longOrShort[indexPath.row]).boolValue));

    if (((NSNumber*)self.longOrShort[indexPath.row]).boolValue) {
        ((TableViewCell *) cell).titleLabel.text = [self randomStringWithLength:10];
    } else {
        ((TableViewCell *) cell).titleLabel.text = [self randomStringWithLength:200];
    }

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
