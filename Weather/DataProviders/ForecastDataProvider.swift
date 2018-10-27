//
//  ForecastDataProvider.swift
//  Weather
//
//  Created by Geoffrey Goutallier on 26/10/2018.
//  Copyright © 2018 Geoffrey Goutallier. All rights reserved.
//

import UIKit

class ForecastDataProvider: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var forecasts: CurrentForecasts?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let forecasts = forecasts else {
            return 0
        }
        
        return forecasts.cnt
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "forecastCell",
            for: IndexPath(row: 0, section: 0)) as! ForecastTableViewCell
        
        guard let forecasts = forecasts else {
            return UITableViewCell()
        }
        
        let dailyForecast = forecasts.list[indexPath.row]
        
        cell.dayLabel.text = dailyForecast.dt.convertToDay()
        cell.minLabel.text = dailyForecast.temp.min.convertToCelsius(.withoutUnit)
        cell.maxLabel.text = dailyForecast.temp.max.convertToCelsius(.withoutUnit)
        
        return cell
    }
}
