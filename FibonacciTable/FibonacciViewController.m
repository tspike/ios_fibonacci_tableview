//
//  FibonacciViewController.m
//  FibonacciTable
//
//  Created by Tres Spicher on 7/16/15.
//  Copyright (c) 2015 Tres Spicher. All rights reserved.
//

#import "FibonacciViewController.h"
#import "FibonacciCalculator.h"
#import "MemoryOptimizedFibonacciCalculator.h"

// This app is inspired by
@interface FibonacciViewController ()

@property NSString *cellReuseIdentifier;
@property Class<FibonacciCalculator> fibonacciCalculator;

@end

@implementation FibonacciViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cellReuseIdentifier = @"com.tspike.fibonaccicell";
    
    self.fibonacciCalculator = [MemoryOptimizedFibonacciCalculator class];
//  self.fibonacciCalculator = [CPUOptimizedFibonacciCalculator class];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // This is an empirically detemined constant that allows for computing Fibonacci numbers up
    // to the maximum viewport size for a full-screen UITableView on iPhone 6.
    
    // A nifty enhancement would be to detect the viewport width, determine the maximum string size
    // viewable within that viewport given the font, and then use logarithms to determine the number of
    // digits in the nth
    return 173;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    UITableViewCell *fibonacciCell = [self.tableView dequeueReusableCellWithIdentifier:self.cellReuseIdentifier];
    if (fibonacciCell == nil) {
        fibonacciCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                               reuseIdentifier:self.cellReuseIdentifier];
    }
    fibonacciCell.textLabel.text = [[self.fibonacciCalculator nthFibonacciNumber:indexPath.row] description];
    return fibonacciCell;
}
@end
