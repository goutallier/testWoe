//
//  ForecastsNetworking.swift
//  Weather
//
//  Created by Geoffrey Goutallier on 26/10/2018.
//  Copyright © 2018 Geoffrey Goutallier. All rights reserved.
//

import Foundation

class ForecastsNetworking: NSObject {

    func downloadForecasts(completionHandler: @escaping (CurrentForecasts?, String) -> Void) {
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
                let forecasts = self.decodeJSON(with: data)
                completionHandler(forecasts, "")
            }
        }
        task.resume()
    }

    func decodeJSON(with data: Data) -> CurrentForecasts? {
        let decoder = JSONDecoder()
        guard let forecastsData = try? decoder.decode(CurrentForecasts.self, from: data) else {
            print("error: Could not decode JSON into currentForecasts")
            return nil
        }
        
        return forecastsData
    }
}

