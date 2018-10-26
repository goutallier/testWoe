//
//  DoubleExtensions.swift
//  Weather
//
//  Created by Geoffrey Goutallier on 26/10/2018.
//  Copyright © 2018 Geoffrey Goutallier. All rights reserved.
//

import Foundation

extension Double {
    
    func convertToCelsius() -> String {
        // convert tº from K to Cº
        let tempKelvin = Measurement.init(value: self, unit: UnitTemperature.kelvin)
        let tempCelsius = tempKelvin.converted(to: UnitTemperature.celsius)
        return String("\(Int(tempCelsius.value.rounded()))º")
    }
    
    enum hourFormat {
        case military
        case american
    }
    
    func convertToHour(format: hourFormat) -> String {
        let dt = Date(timeIntervalSince1970: self)
        let formatter = DateFormatter()
        
        switch format {
        case .american:
            formatter.dateFormat = "h:mm a"
        default:
            // in military time:
            formatter.dateFormat = "HH:mm"
        }
        
        return formatter.string(from: dt)
    }
}
