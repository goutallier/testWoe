//
//  DoubleExtensions.swift
//  Weather
//
//  Created by Geoffrey Goutallier on 26/10/2018.
//  Copyright © 2018 Geoffrey Goutallier. All rights reserved.
//

import Foundation

extension Double {
    
    enum unitAppearance {
        case withUnit
        case withoutUnit
    }
    
    func convertToCelsius(_ unitAppears : unitAppearance) -> String {
        // convert tº from K to Cº
        let tempKelvin = Measurement.init(value: self, unit: UnitTemperature.kelvin)
        let tempCelsius = tempKelvin.converted(to: UnitTemperature.celsius)
        var unitSring : String
        switch unitAppears {
        case .withUnit:
            unitSring = "º"
        default:
            unitSring = ""
        }
        return String("\(Int(tempCelsius.value.rounded()))\(unitSring)")
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
