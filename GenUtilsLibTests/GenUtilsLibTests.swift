//
//  GenUtilsLibTests.swift
//  GenUtilsLibTests
//
//  Created by Karthik on 27/09/19.
//  Copyright © 2019 Moback. All rights reserved.
//

import XCTest
@testable import GenUtilsLib

class GenUtilsLibTests: XCTestCase {
    
    
    var genUtilsLib: GenUtilsLib!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        genUtilsLib = GenUtilsLib()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAdd() {
        XCTAssertEqual(genUtilsLib.add(a: 1, b: 1), 2)
    }
    
    func testSubtract() {
        XCTAssertEqual(genUtilsLib.sub(a: 2, b: 1), 1)
    }
    
    func testMultiply() {
        XCTAssertEqual(genUtilsLib.multiply(a: 2, b: 1), 2)
    }
    
    func testDivide() {
        XCTAssertEqual(genUtilsLib.divide(a: 5, b: 1), 5)
    }
    
    func testPercentageForScreenWidthAndHeight(){
        XCTAssertNotNil(genUtilsLib.getWidthForPercent(percent: 15))
        XCTAssertNotNil(genUtilsLib.getWidthForPercentNReturnInt(percent: 15))
        XCTAssertNotNil(genUtilsLib.getHeightForPercent(percent: 15))
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
