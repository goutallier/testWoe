//
//  ViewController.swift
//  Weather
//
//  Created by Geoffrey Goutallier on 25/10/2018.
//  Copyright © 2018 Geoffrey Goutallier. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // these vars will hold the reference to the respective childViewControllers
    fileprivate var currentViewController: CurrentViewController?
    fileprivate var forecastsViewController: ForecastsViewController?
    fileprivate var statsViewController: StatsViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Weather"
        
        // load current weather data
        let cwn = CurrentWeatherNetworking()
        cwn.downloadCurrentWeather(completionHandler: didDownloadCurrentData(current:message:))
        
        // load forecast data
        let fn = ForecastsNetworking()
        fn.downloadForecasts(completionHandler: didDownloadForecastsData(current:message:))
        
    }

    func didDownloadCurrentData(current : CurrentWeatherData?, message: String?) {
        guard let current = current else {
            return
        }
        // populate views current and stats
        currentViewController?.currentWeather = current
        currentViewController?.reload()
        
        // remove main activity indicator 
    }
    
    func didDownloadForecastsData(current : CurrentForecasts?, message: String?) {
        
        guard let current = current else {
            return
        }
        // populate forecasts
        guard let dataProvider = forecastsViewController?.dataProvider as? ForecastDataProvider else {
            return
        }
        dataProvider.forecasts = current
        
        forecastsViewController?.reload()
        
        // remove forecast activity indicator
    }

    
    // prepare(for segue, sender) is used here to retrieve the references of childViewControllers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        
        if let currentController = destination as? CurrentViewController {
            currentViewController = currentController
        }
        
        if let forecastController = destination as? ForecastsViewController {
            forecastsViewController = forecastController
        }
        
        if let statsController = destination as? StatsViewController {
            statsViewController = statsController
        }
    }
}


