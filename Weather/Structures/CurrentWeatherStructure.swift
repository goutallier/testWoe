//
//  CurrentWeatherStructure.swift
//  Weather
//
//  Created by Geoffrey Goutallier on 26/10/2018.
//  Copyright © 2018 Geoffrey Goutallier. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let main: String
    let description: String
}

struct Main: Codable {
    let temp: Double
    let pressure: Double
    let humidity: Double
}

struct Wind: Codable {
    let speed: Double
    let deg: Int
}

struct Clouds: Codable {
    let all: Int
}

struct Rain: Codable {
    let volume: Double
}

struct Sys: Codable {
    let sunrise: Double
    let sunset: Double
}

struct CurrentWeatherData : Decodable {
    let weather: [Weather]
    let main: Main
    let clouds: Clouds?
    let rain: Rain?
    let sys: Sys
    let name: String
}
