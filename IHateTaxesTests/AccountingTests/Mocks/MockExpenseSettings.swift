//
//  MockExpenseSettings.swift
//  IHateTaxesTests
//
//  Created by Samuel R de Freitas on 29/12/24.
//

import Foundation
@testable import IHateTaxes


class MockExpenseSettings: ExpenseSettings {
    
    init() {
        
        super.init(minimumWage: 0, proLaborePercentage: 0, contabilizeiMonthlyFee: 120, rental: 0, digitalSignature: 0, numberOfMonthsToSaveMoney: 0, isNational: false)
        
    }
    
    override func getFundsEarmarkedForAnnualBills() -> Double {
        return 100
    }
    
}
