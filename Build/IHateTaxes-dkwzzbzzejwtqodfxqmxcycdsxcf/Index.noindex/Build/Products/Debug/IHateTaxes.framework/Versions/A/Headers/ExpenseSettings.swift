//
//  ExpenseSettings.swift
//  IHateTaxes
//
//  Created by Samuel R de Freitas on 29/12/24.
//

import Foundation

public class ExpenseSettings: Codable {
    
    var minimumWage: Double
    var proLaborePercentage: Double
    public var contabilizeiMonthlyFee: Double
    var rental: Double
    var digitalSignature: Double
    var numberOfMonthsToSaveMoney: Int
    var isNational: Bool
    
    
    public init(minimumWage: Double, proLaborePercentage: Double, contabilizeiMonthlyFee: Double, rental: Double, digitalSignature: Double, numberOfMonthsToSaveMoney: Int, isNational: Bool) {
        
        self.minimumWage = minimumWage
        self.proLaborePercentage = proLaborePercentage
        self.contabilizeiMonthlyFee = contabilizeiMonthlyFee
        self.rental = rental
        self.digitalSignature = digitalSignature
        self.numberOfMonthsToSaveMoney = numberOfMonthsToSaveMoney
        self.isNational = isNational
        
    }
    
    public func getAnnualExpense() -> Double {
        
        return self.rental + self.digitalSignature
        
    }
    
    public func getFundsEarmarkedForAnnualBills() -> Double {
        return getAnnualExpense() / Double(self.numberOfMonthsToSaveMoney)
    }
    
}
