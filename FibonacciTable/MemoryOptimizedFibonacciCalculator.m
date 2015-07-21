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

// A memory-optimized implementation of calculating the nth fibonacci number.
// By not storing previously completed values, we use less memory. This is mostly didactic
// considering that the memory used by caching a few fibonacci numbers is dwarfed by the
// footprint of the rest of the app and UI views.
- (NSDecimalNumber*)nthFibonacciNumber:(NSInteger)n {
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