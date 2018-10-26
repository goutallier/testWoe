//
//  CurrentWeatherNetworking.swift
//  Weather
//
//  Created by Geoffrey Goutallier on 26/10/2018.
//  Copyright © 2018 Geoffrey Goutallier. All rights reserved.
//

import UIKit

class CurrentWeatherNetworking: NSObject {

    func downloadCurrentWeather() {
        let url = URL(string:"https://samples.openweathermap.org/data/2.5/forecast/daily?id=524901&appid=b1b15e88fa797225412429c1c50c122a1")!
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    print(response?.description ?? "invalid response")
                    return
            }
            
            guard let data = data else {
                print("error: no data")
                return
            }
            
            DispatchQueue.main.async {
                self.decodeJSON(with: data)
            }
        }
        task.resume()
    }
    
    func decodeJSON(with data: Data) {
        let decoder = JSONDecoder()
        guard let forecastData = try? decoder.decode(CurrentForecast.self, from: data) else {
            print("error: Could not decode JSON into currentForecast")
            return
        }
        
        forecastData.list.count
        // convert timestamp
        let forecast = forecastData.list.first as! Forecast
        let dt = Date(timeIntervalSince1970: forecast.dt)
        
        // convert timestamp to weekday
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "EEEE"
        let day = formatter.string(from: dt)
        
        // retrieve min and max temp
        let temp = forecast.temp
        print(convertToCelsius(tempKelvin: temp.max))
        print(convertToCelsius(tempKelvin: temp.min))
    }
    
    func convertToCelsius(tempKelvin: Double) -> String {
        let tempKelvin = Measurement.init(value: tempKelvin, unit: UnitTemperature.kelvin)
        let tempCelsius = tempKelvin.converted(to: UnitTemperature.celsius)
        return String("\(Int(round(tempCelsius.value)))º")
    }
}
