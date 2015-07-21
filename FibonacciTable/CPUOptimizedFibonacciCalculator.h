//
//  CPUOptimizedFibonacciCalculator.h
//  FibonacciTable
//
//  Created by Tres Spicher on 7/20/15.
//  Copyright (c) 2015 Tres Spicher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FibonacciCalculator.h"

extern unsigned int const MAX_FIBONACCI_N;

@interface CPUOptimizedFibonacciCalculator : NSObject <FibonacciCalculator>

- (NSDecimalNumber*)nthFibonacciNumber:(NSInteger)n;

@end