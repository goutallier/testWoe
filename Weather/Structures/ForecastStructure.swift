//
//  ForecastStructure.swift
//  Weather
//
//  Created by Geoffrey Goutallier on 26/10/2018.
//  Copyright © 2018 Geoffrey Goutallier. All rights reserved.
//

import Foundation

struct Temp : Codable {
    let min: Double
    let max: Double
}

struct Forecast : Codable {
    let dt : Double
    let temp : Temp
}

struct CurrentForecast : Codable {
    let cnt: Int
    let list: [Forecast]
}
