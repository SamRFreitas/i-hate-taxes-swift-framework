//
//  Vrau.swift
//  IHateTaxes
//
//  Created by Samuel R de Freitas on 29/12/24.
//

import Foundation

public class Vrau {
    
    // Its just a comment to test git integration on XCode
    
    let amount: Double
    public let expenseSettings: ExpenseSettings
    public var inss: Inss? = nil
    public var das: Das? = nil
    
    public init(amount: Double, expenseSettings: ExpenseSettings) {
        
        self.amount = amount
        self.expenseSettings = expenseSettings
        
    }
    
    public func configure() {
        
        let amountForInssCalculate = self.getAmountForInssCalculation()
        
        self.inss = Inss(amount: amountForInssCalculate)
        
        self.das = Das(amount: self.amount, isNational: self.expenseSettings.isNational)
        
    }
    
    public func getAmountForInssCalculation() -> Double {
        
        let amountForInssCalculation = AmountHandler().calculate(percentage: self.amount, of: self.expenseSettings.proLaborePercentage)
        
        return amountForInssCalculation > self.expenseSettings.minimumWage ?
            amountForInssCalculation : self.expenseSettings.minimumWage
        
    }
    
    
    public func getDla() -> Double {
        
        guard let inss = inss, let das = das else {
            fatalError("Inss and Das must be configured before use.")
        }
        
        let dasTax = das.getTax()
        let proLabore = inss.proLabore
        let inssTax = inss.getTax()
        let irrfTax = inss.getIrrfTax()
        let fundsEarmarkedForAnnualBills = expenseSettings.getFundsEarmarkedForAnnualBills()
        
        
        let totalInssTaxes = inssTax + irrfTax
        let totalmonthlyExpense = expenseSettings.contabilizeiMonthlyFee + fundsEarmarkedForAnnualBills
       
        let total = self.amount - dasTax - proLabore - totalInssTaxes - totalmonthlyExpense

        return total
        
    }
    
}
