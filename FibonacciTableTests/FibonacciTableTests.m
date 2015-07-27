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
#import "CPUOptimizedFibonacciCalculator.h"

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

- (void)testFibonacciCalculators {
    MemoryOptimizedFibonacciCalculator *memoryOptimizedCalculator = [[MemoryOptimizedFibonacciCalculator alloc] init];
    [self testFibonacciFor:memoryOptimizedCalculator];
    CPUOptimizedFibonacciCalculator *cpuOptimizedCalculator = [[CPUOptimizedFibonacciCalculator alloc] init];
    [self testFibonacciFor:cpuOptimizedCalculator];
}

- (void)testFibonacciFor:(NSObject<FibonacciCalculator>*)calculator {
    XCTAssertEqual([[calculator nthFibonacciNumber:0] intValue], 1, @"Pass");
    XCTAssertEqual([[calculator nthFibonacciNumber:1] intValue], 1, @"Pass");
    XCTAssertEqual([[calculator nthFibonacciNumber:2] intValue], 2, @"Pass");
    XCTAssertEqual([[calculator nthFibonacciNumber:3] intValue], 3, @"Pass");
    XCTAssertEqual([[calculator nthFibonacciNumber:4] intValue], 5, @"Pass");
    XCTAssertEqual([[calculator nthFibonacciNumber:5] intValue], 8, @"Pass");
    
    XCTAssertEqual([[calculator nthFibonacciNumber:49] longLongValue], 12586269025, @"Pass");
}

@end
