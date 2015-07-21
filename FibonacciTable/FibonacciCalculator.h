//
//  FibonacciCalculator.h
//  FibonacciTable
//
//  Created by Tres Spicher on 7/20/15.
//  Copyright (c) 2015 Tres Spicher. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FibonacciCalculator <NSObject>
- (NSDecimalNumber*)nthFibonacciNumber:(NSInteger)n;
@end
