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
        XCTAssertNotNil(genUtilsLib.getWidthFor(percent: 15))
        XCTAssertNotNil(genUtilsLib.getWidthForPercentNReturnInt(percent: 15))
        XCTAssertNotNil(genUtilsLib.getHeightFor(percent: 15))
        XCTAssertNotNil(genUtilsLib.getHeightForPercentNReturnInt(percent: 15))
        
    }
    
    func testDateToStringConversions(){
        XCTAssertNotNil(genUtilsLib.getCurrentTime())
        XCTAssertNotNil(genUtilsLib.getDay(time: Int(Date().timeIntervalSince1970 * 1000)))
        XCTAssertNotNil(genUtilsLib.getTime(time: Int(Date().timeIntervalSince1970 * 1000)))
        XCTAssertNotNil(genUtilsLib.getTimeForMessage(time: Int(Date().timeIntervalSince1970 * 1000)))
        
    }
    
    func testDateExtensionAPIs() {
        let sampleDate = Date()
        let lastYearDate = Calendar.current.date(byAdding: .year, value: -2, to: Date())
        let lastMonthDate = Calendar.current.date(byAdding: .month, value: -2, to: Date())
        let lastDaysDate = Calendar.current.date(byAdding: .day, value: -2, to: Date())
        let lastHoursDate = Calendar.current.date(byAdding: .hour, value: -3, to: Date())
        let lastWeeksDate = Calendar.current.date(byAdding: .weekday, value: -2, to: Date())
        let lastMinsDate = Calendar.current.date(byAdding: .minute, value: -3, to: Date())
        let lastSecondsDate = Calendar.current.date(byAdding: .second, value: -3, to: Date())
        
        XCTAssertNotNil(sampleDate.years(from: lastYearDate!))
        XCTAssertNotNil(sampleDate.months(from: lastMonthDate!))
        XCTAssertNotNil(sampleDate.days(from: lastDaysDate!))
        XCTAssertNotNil(sampleDate.hours(from: lastHoursDate!))
        XCTAssertNotNil(sampleDate.weeks(from: lastWeeksDate!))
        XCTAssertNotNil(sampleDate.minutes(from: lastMinsDate!))
        XCTAssertNotNil(sampleDate.seconds(from: lastSecondsDate!))
        
        // To convert date to string format: dd MMM yyyy
        XCTAssertNotNil(sampleDate.toDateString())
        
        // To convert date to ical style with UTC zone
        XCTAssertNotNil(sampleDate.toString())
        XCTAssertNotNil(sampleDate.toDayNumString())
        XCTAssertNotNil(sampleDate.toDateString())
        XCTAssertNotNil(sampleDate.toTimeString())
        XCTAssertNotNil(sampleDate.toDayWeekString())
        
    }
    
    func testStringExtensionAPIs() {
        // To convert string(having date) in ical style to other formats date/strings
        let sampleDate = Date()
        let dateStr = sampleDate.toString()
        XCTAssertNotNil(dateStr.toDate())
        XCTAssertNotNil(dateStr.toDayWeekString())
        XCTAssertNotNil(dateStr.toTimeString())
        XCTAssertNotNil(dateStr.toDayNumString())
        XCTAssertNotNil(dateStr.toDateString())
        
        // Convert date to millis
        XCTAssertNotNil(sampleDate.millisecondsSince1970)
        
        // To get file name and extension having filepath string
        let filepath = "/var/mobile/Containers/Data/Application/29306029-BDCF-4BEA-93A6-D5626CBAAA90/Documents/x.jpg"
        XCTAssertNotNil(filepath.fileName())
        XCTAssertNotNil(filepath.fileExtension())
        
    }
    
    func testRandomGeneratorAPIs() {
        let rangeParam = 0..<10
        let num:Int = 2
        let obj1 = genUtilsLib.generateRandomNumsForRange(item: num, range1: rangeParam)
        XCTAssertNotNil(obj1)
        XCTAssertNotEqual(obj1, -1)
//        print("rand number 1: \(obj1)")
        let rangeParam1 = Float(0.0)..<Float(10.0)
        let numf:Float = 2.0
        let obj3 = genUtilsLib.generateRandomNumsForRange(item: numf, range1: rangeParam1)
        XCTAssertNotNil(obj3)
        XCTAssertNotEqual(obj3, -1)
//        print("rand number 1: \(obj3)")
        
        let closerangeParam = 0...10
        let obj2 = genUtilsLib.generateRandomNumsForClosedRange(item: num, range2: closerangeParam)
        let closerangeParam1 = Float(0)...Float(10)
        let obj4 = genUtilsLib.generateRandomNumsForClosedRange(item: numf, range2: closerangeParam1)
//        print("rand number 2: \(obj2), float num:\(obj4)")
        XCTAssertNotNil(obj2)
        XCTAssertNotEqual(obj2, 0)
        XCTAssertNotNil(obj4)
        XCTAssertNotEqual(obj4, 0)
        
        
        let length = 10
        let rnstr = genUtilsLib.generateRandomStrOf(length: length)
        let alphanrnstr = genUtilsLib.generateRandomAlphaNumbericStrOf(length: length)
//        print("Random alpha numeric string :\(alphanrnstr), normal string:\(rnstr) of length:\(length)")
        XCTAssertNotNil(rnstr)
        XCTAssertNotNil(alphanrnstr)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
