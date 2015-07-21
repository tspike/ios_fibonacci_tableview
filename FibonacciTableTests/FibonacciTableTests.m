//
//  FibonacciTableTests.m
//  FibonacciTableTests
//
//  Created by Tres Spicher on 7/16/15.
//  Copyright (c) 2015 Tres Spicher. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "MemoryOptimizedFibonacciCalculator.h"

@interface FibonacciTableTests : XCTestCase

@end

@implementation FibonacciTableTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFibonacciCalculator {
    XCTAssertEqual([[MemoryOptimizedFibonacciCalculator nthFibonacciNumber:0] intValue], 1, @"Pass");
    XCTAssertEqual([[MemoryOptimizedFibonacciCalculator nthFibonacciNumber:1] intValue], 1, @"Pass");
    XCTAssertEqual([[MemoryOptimizedFibonacciCalculator nthFibonacciNumber:2] intValue], 2, @"Pass");
    XCTAssertEqual([[MemoryOptimizedFibonacciCalculator nthFibonacciNumber:3] intValue], 3, @"Pass");
    XCTAssertEqual([[MemoryOptimizedFibonacciCalculator nthFibonacciNumber:4] intValue], 5, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
