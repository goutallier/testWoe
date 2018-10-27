//
//  DoubleExtensionTest.swift
//  WeatherTests
//
//  Created by Geoffrey Goutallier on 27/10/2018.
//  Copyright © 2018 Geoffrey Goutallier. All rights reserved.
//

import XCTest
@testable import Weather

class DoubleExtensionTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDoubleHasExtensionConvertToCelsius() {
        let test: Double
        test = 273.0
        XCTAssertEqual(test.convertToCelsius(.withoutUnit), "0", "Double type should have a convertToCelsius() extension")
    }
    
    func testDoubleExtensionConvertToCelsiusReturnsStringWithUnit() {
        let test: Double
        test = 273.0
        XCTAssertEqual(test.convertToCelsius(.withUnit), "0º", "Double type should have a convertToCelsius() extension")
    }
    
    func testDoubleExtensionConvertToHourReturnsAmericanHourString() {
        let test: Double
        test = 1485802800
        XCTAssertEqual(test.convertToHour(format: .american), "8:00 PM", "Double type should have a convertToHour(.american) extension")
    }
    
    func testDoubleExtensionConvertToHourReturnsMilitaryHourString() {
        let test: Double
        test = 1485802800
        XCTAssertEqual(test.convertToHour(format: .military), "20:00", "Double type should have a convertToHour(.military) extension")
    }
    
    func testDoubleExtensionConvertToDayReturnsStringOfWeekday() {
        let test: Double
        test = 1485802800
        XCTAssertEqual(test.convertToDay(), "Monday", "Double type should have a convertToDay() extension")
    }
    
    func testDoubleExtensionConvertToPercent() {
        let test: Double
        test = 98
        XCTAssertEqual(test.convertToPercent(), "98 %", "Double type should have a convertToPercent() extension")
    }
    
    func testDoubleExtensionConvertToHpa() {
        let test: Double
        test = 1002
        // WARNING: this is not a space but a thousands separator
        XCTAssertEqual(test.convertToHpa(), "1 002 hPa", "Double type should have a convertToHpa() extension")
    }
}
