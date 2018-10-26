//
//  CurrentViewController.swift
//  Weather
//
//  Created by Geoffrey Goutallier on 25/10/2018.
//  Copyright © 2018 Geoffrey Goutallier. All rights reserved.
//

import UIKit

class CurrentViewController: UIViewController {

    @IBOutlet weak var cityNameLbl: UILabel!
    @IBOutlet weak var summaryLbl: UILabel!
    @IBOutlet weak var temperatureLbl: UILabel!
    
    var currentWeather: CurrentWeatherData?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func reload() {
        guard let cityName = currentWeather?.name else {
            return
        }
        
        cityNameLbl.text = cityName
        
        guard let summary = currentWeather?.weather.first?.description else {
            return
        }
        
        summaryLbl.text = summary
        
        guard let temp = currentWeather?.main.temp else {
            return
        }
        
        temperatureLbl.text = String(temp)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
