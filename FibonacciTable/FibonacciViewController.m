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
#import "CPUOptimizedFibonacciCalculator.h"

// This is an empirically detemined constant that allows for computing Fibonacci numbers up
// to the maximum viewport size for a full-screen UITableView on iPhone 6.

// A nifty enhancement would be to detect the viewport width, determine the maximum string size
// viewable within that viewport given the font, and then use logarithms to determine the number of
// digits in the nth
unsigned int const MAX_FIBONACCI_N = 173;

@interface FibonacciViewController ()

@property NSString *cellReuseIdentifier;
@property NSObject<FibonacciCalculator> *fibonacciCalculator; // we have different implementations

@end

@implementation FibonacciViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cellReuseIdentifier = @"com.tspike.fibonaccicell";
    
//    self.fibonacciCalculator = [[MemoryOptimizedFibonacciCalculator alloc] init];
    self.fibonacciCalculator = [[CPUOptimizedFibonacciCalculator alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 173;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    UITableViewCell *fibonacciCell = [self.tableView dequeueReusableCellWithIdentifier:self.cellReuseIdentifier];
    if (fibonacciCell == nil) {
        fibonacciCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                               reuseIdentifier:self.cellReuseIdentifier];
    }
    
    // keep track of which row this is so we can check when the async call below completes
    // that we still have a reference to the correct cell
    fibonacciCell.tag = indexPath.row;
    fibonacciCell.textLabel.text = @"";
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *cellText = [[self.fibonacciCalculator nthFibonacciNumber:indexPath.row] description];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (fibonacciCell.tag == indexPath.row) {
                fibonacciCell.textLabel.text = cellText;
            }
        });
    });
    return fibonacciCell;
}
@end
