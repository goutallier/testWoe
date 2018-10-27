//
//  ForecastDataProviderTest.swift
//  WeatherTests
//
//  Created by Geoffrey Goutallier on 27/10/2018.
//  Copyright © 2018 Geoffrey Goutallier. All rights reserved.
//

import XCTest
@testable import Weather

class ForecastDataProviderTest: XCTestCase {

    var sut: ForecastDataProvider!
    var tableView: UITableView!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = ForecastDataProvider()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(
            withIdentifier: "ForecastsViewController")
        let forecastsVC = (viewController as! ForecastsViewController)
        forecastsVC.loadViewIfNeeded()
        tableView = forecastsVC.tableView
        tableView.dataSource = sut
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_NumberOfSections_isOne() {
        let numberOfSections = tableView.numberOfSections
        XCTAssertEqual(numberOfSections, 1)
    }
}
