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
    
    
}
