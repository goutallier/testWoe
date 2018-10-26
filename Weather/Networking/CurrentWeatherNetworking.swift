//
//  CurrentWeatherNetworking.swift
//  Weather
//
//  Created by Geoffrey Goutallier on 26/10/2018.
//  Copyright © 2018 Geoffrey Goutallier. All rights reserved.
//

import UIKit

class CurrentWeatherNetworking: NSObject {

    func downloadCurrentWeather(completionHandler: @escaping (CurrentWeatherData?, String) -> Void) {
        let url = URL(string:"https://samples.openweathermap.org/data/2.5/weather?q=Lyon&appid=b1b15e88fa797225412429c1c50c122a1")!
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
                let currentWeather = self.decodeJSON(with: data)
                completionHandler(currentWeather, "")
            }
        }
        task.resume()
    }
    
    func decodeJSON(with data: Data) -> CurrentWeatherData? {
        let decoder = JSONDecoder()
        guard let forecastData = try? decoder.decode(CurrentWeatherData.self, from: data) else {
            print("error: Could not decode JSON into currentForecast")
            return nil
        }
        return forecastData
    }
}
