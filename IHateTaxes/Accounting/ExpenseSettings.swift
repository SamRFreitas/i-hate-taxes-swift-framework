//
//  ExpenseSettings.swift
//  IHateTaxes
//
//  Created by Samuel R de Freitas on 29/12/24.
//

import Foundation

class ExpenseSettings {
    
    var minimumWage: Double
    var proLaborePercentage: Double
    var contabilizeiMonthlyFee: Double
    var rental: Double
    var digitalSignature: Double
    var numberOfMonthsToSaveMoney: Int
    var isNational: Bool
    
    
    init(minimumWage: Double, proLaborePercentage: Double, contabilizeiMonthlyFee: Double, rental: Double, digitalSignature: Double, numberOfMonthsToSaveMoney: Int, isNational: Bool) {
        
        self.minimumWage = minimumWage
        self.proLaborePercentage = proLaborePercentage
        self.contabilizeiMonthlyFee = contabilizeiMonthlyFee
        self.rental = rental
        self.digitalSignature = digitalSignature
        self.numberOfMonthsToSaveMoney = numberOfMonthsToSaveMoney
        self.isNational = isNational
        
    }
    
    func getAnnualExpense() -> Double {
        
        return self.rental + self.digitalSignature
        
    }
    
    func getFundsEarmarkedForAnnualBills() -> Double {
        return getAnnualExpense() / Double(self.numberOfMonthsToSaveMoney)
    }
    
}
