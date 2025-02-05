//
//  Inss.swift
//  IHateTaxes
//
//  Created by Samuel R de Freitas on 18/12/24.
//

import Foundation

public struct IrrfDeduction {
    
    var aliquot: Double = 0
    var value: Double = 0
    
    public init(amountWithoutTax: Double) {
        
        if amountWithoutTax > 0 && amountWithoutTax <= 1903.98 {
            
            self.aliquot = 0.0
            self.value = 0.0
            
        } else if amountWithoutTax > 1903.99 && amountWithoutTax <= 2826.65 {
            
            self.aliquot = 7.5
            self.value = 142.80
            
        } else if amountWithoutTax >= 2826.66 && amountWithoutTax <= 3751.05 {
            
            self.aliquot = 15
            self.value = 354.8
            
        } else if amountWithoutTax >= 3751.06 && amountWithoutTax <= 4664.68 {
            
            self.aliquot = 22.5
            self.value = 636.13
            
        } else if amountWithoutTax > 4664.68 {
            
            self.aliquot = 27.5
            self.value = 869.36
        }
        
    }
    
}

public class Inss {
    
    public let proLabore: Double
    
    init(amount: Double) {
        
        self.proLabore = amount
    
    }
    
    public func getTax() -> Double {
            
        // Plano simplificado (11%) - Do Salário Mínimo
        let result = AmountHandler().calculate(percentage: 11, of: self.proLabore)
        return result
        
    }
    
    public func getIrrfTax() -> Double {
            
        let amountWithoutInssTax = self.proLabore - self.getTax()
        
        let irrfDeduction = IrrfDeduction(amountWithoutTax: amountWithoutInssTax)
        
        let irrfTax = AmountHandler().calculate(percentage: irrfDeduction.aliquot, of: amountWithoutInssTax) - irrfDeduction.value
        
        let result = irrfTax < 0 ? 0 : irrfTax
       
        return AmountHandler().roundDouble(amount: result)
        
    }
    
}
