//
//  AmountHandler.swift
//  IHateTaxes
//
//  Created by Samuel R de Freitas on 18/12/24.
//

import Foundation

struct AmountHandler {
    
    func calculate(percentage: Double, of value: Double) -> Double {
        
        let result = value * (percentage / 100)
        
        return roundDouble(amount: result)
        
    }
    
    func roundDouble(amount : Double) -> Double {
        
        let result = round(amount * 100) / 100.0
        
        return result
        
    }
    
    func format(amount: Double, withDecimalPlaces decimalPlaces: Int = 2) -> String {
        
        let formatedValueString = String(format: "%.\(decimalPlaces)f", amount)
        
        return formatedValueString
        
    }
    
}
