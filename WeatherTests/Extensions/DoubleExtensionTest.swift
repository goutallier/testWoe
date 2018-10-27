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

    func test_DoubleHasExtension_ConvertToCelsius() {
        let test: Double
        test = 273.0
        XCTAssertEqual(test.convertToCelsius(.withoutUnit), "0", "Double type should have a convertToCelsius() extension")
    }
    
    func test_DoubleExtension_ConvertToCelsius_ReturnsStringWithUnit() {
        let test: Double
        test = 273.0
        XCTAssertEqual(test.convertToCelsius(.withUnit), "0º", "Double type should have a convertToCelsius() extension")
    }
    
    func test_DoubleExtension_ConvertToHour_ReturnsAmericanHourString() {
        let test: Double
        test = 1485802800
        XCTAssertEqual(test.convertToHour(format: .american), "8:00 PM", "Double type should have a convertToHour(.american) extension")
    }
    
    func test_DoubleExtension_ConvertToHour_ReturnsMilitaryHourString() {
        let test: Double
        test = 1485802800
        XCTAssertEqual(test.convertToHour(format: .military), "20:00", "Double type should have a convertToHour(.military) extension")
    }
    
    func test_DoubleExtension_ConvertToDay_ReturnsStringOfWeekday() {
        let test: Double
        test = 1485802800
        XCTAssertEqual(test.convertToDay(), "Monday", "Double type should have a convertToDay() extension")
    }
    
    func test_DoubleExtension_ConvertToPercent() {
        let test: Double
        test = 98
        XCTAssertEqual(test.convertToPercent(), "98 %", "Double type should have a convertToPercent() extension")
    }
    
    func test_DoubleExtension_ConvertToHpa() {
        let test: Double
        test = 1002
        // WARNING: this is not a space but a thousands separator
        XCTAssertEqual(test.convertToHpa(), "1 002 hPa", "Double type should have a convertToHpa() extension")
    }
}
