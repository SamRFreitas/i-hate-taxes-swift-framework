//
//  Das.swift
//  IHateTaxes
//
//  Created by Samuel R de Freitas on 18/12/24.
//

import Foundation

class Das {
    
    var amount: Double
    var isNational: Bool
    var percentage: Double
    
    init(amount: Double, isNational: Bool = false) {
        
        self.amount = amount
        self.isNational = isNational
        self.percentage = self.isNational ? 6.5 : 3.05
        
    }
    
    func getTax() -> Double {
        let result = AmountHandler().calculate(percentage: self.percentage, of: self.amount)
        return result
    }
    
}
