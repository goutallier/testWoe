//
//  StatsViewController.swift
//  Weather
//
//  Created by Geoffrey Goutallier on 25/10/2018.
//  Copyright © 2018 Geoffrey Goutallier. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    @IBOutlet weak var sunriseTime: UILabel!
    @IBOutlet weak var sunsetTime: UILabel!
    @IBOutlet weak var cloudsPercent: UILabel!
    @IBOutlet weak var rainHeight: UILabel!
    @IBOutlet weak var humidityPercent: UILabel!
    @IBOutlet weak var pressionQuantity: UILabel!
    
    var currentWeather: CurrentWeatherData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func reload() {
        if let sunrise = currentWeather?.sys.sunrise {
            sunriseTime.text = sunrise.convertToHour(format: .american)
        }
        
        if let sunset = currentWeather?.sys.sunset {
            sunsetTime.text = sunset.convertToHour(format: .american)
        }
        
        if let clouds = currentWeather?.clouds?.all {
            cloudsPercent.text = clouds.convertToPercent()
        }
        
        if let rain = currentWeather?.rain?.volume {
            rainHeight.text = "\(rain) mm"
        }
        
        if let humidity = currentWeather?.main.humidity {
            humidityPercent.text = humidity.convertToPercent()
        }
        
        if let pressure = currentWeather?.main.pressure {
            pressionQuantity.text = pressure.convertToHpa()
        }
    }
}
