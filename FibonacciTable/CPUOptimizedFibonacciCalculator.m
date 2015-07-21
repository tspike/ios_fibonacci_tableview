//
//  CPUOptimizedFibonacciCalculator.m
//  FibonacciTable
//
//  Created by Tres Spicher on 7/20/15.
//  Copyright (c) 2015 Tres Spicher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPUOptimizedFibonacciCalculator.h"

@interface CPUOptimizedFibonacciCalculator ()
@property NSMutableDictionary *numberCache;
@end

@implementation CPUOptimizedFibonacciCalculator

- (id)init {
    self = [super init];
    if (self) {
        self.numberCache = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (NSDecimalNumber*)nthFibonacciNumber:(NSInteger)n {
    if (n == 0 || n == 1) {
        return [[NSDecimalNumber alloc] initWithInt:1];
    } else {
        NSDecimalNumber *nMinusOneFibonacci = [self.numberCache objectForKey:[NSNumber numberWithInteger:n-1]];
        NSDecimalNumber *nMinusTwoFibonacci = [self.numberCache objectForKey:[NSNumber numberWithInteger:n-2]];;
        if (nMinusOneFibonacci == nil) {
            nMinusOneFibonacci = [self nthFibonacciNumber:n-1];
            [self.numberCache setObject:nMinusOneFibonacci forKey:[NSNumber numberWithInteger:n-1]];
        }
        if (nMinusTwoFibonacci == nil) {
            nMinusTwoFibonacci = [self nthFibonacciNumber:n-2];
            [self.numberCache setObject:nMinusTwoFibonacci forKey:[NSNumber numberWithInteger:n-2]];
        }
        NSDecimalNumber *fib = [nMinusOneFibonacci decimalNumberByAdding:nMinusTwoFibonacci];
        return fib;
    }
}
@end