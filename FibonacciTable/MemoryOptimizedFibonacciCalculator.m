//
//  FibonacciCalculator.m
//  FibonacciTable
//
//  Created by Tres Spicher on 7/20/15.
//  Copyright (c) 2015 Tres Spicher. All rights reserved.
//

#import "MemoryOptimizedFibonacciCalculator.h"

@interface MemoryOptimizedFibonacciCalculator ()
@end
@implementation MemoryOptimizedFibonacciCalculator

// This algorithm trades CPU cycles for memory usage. An alternative would be to
// use the naive recursive algorithm with dynamic programming, but since we can run
// this in a separate thread, I choose to reduce the memory footprint at the cost of
// CPU use/battery life. Battery life only suffers when the user is actively using the
// application, which is an established behavior with mobile phones and therefore consistent
// with user expectations.
+ (NSDecimalNumber*)nthFibonacciNumber:(NSInteger)n {
    NSDecimalNumber *a = [[NSDecimalNumber alloc] initWithInt:1];
    NSDecimalNumber *b = [[NSDecimalNumber alloc] initWithInt:1];
    for (int i=3; i<=n+1; i++) {
        NSDecimalNumber *c = [a decimalNumberByAdding:b];
        a = b;
        b = c;
    }
    return b;
}
@end