//
//  ExpenseSettings.swift
//  IHateTaxes
//
//  Created by Samuel R de Freitas on 29/12/24.
//

import XCTest
@testable import IHateTaxes

final class ExpenseSettingsTets: XCTestCase {
    
    func testGetAnnualExpense() {
        
        let expectedAnnualExpense: Double = 200
        let expenseSettings = ExpenseSettings(minimumWage: 0, proLaborePercentage: 0, contabilizeiMonthlyFee: 0, rental: 120, digitalSignature: 80, numberOfMonthsToSaveMoney: 0, isNational: false)
        
        XCTAssertEqual(expenseSettings.getAnnualExpense(), expectedAnnualExpense, "Should return 120(rental) + 80(digitalSignature) = 200")
        
    }
    
    func testGetFundsEarmarkedForAnnualBills() {
        
        let expectedAnnualExpense: Double = 144
        let expenseSettings = ExpenseSettings(minimumWage: 0, proLaborePercentage: 0, contabilizeiMonthlyFee: 0, rental: 100, digitalSignature: 44, numberOfMonthsToSaveMoney: 12, isNational: false)
        
        XCTAssertEqual(expenseSettings.getAnnualExpense(), expectedAnnualExpense, "Should return 100(rental) + 44(digitalSignature) = 144")
        
        let expectedFundsEarmarkedForAnnualBills: Double = 12
        
        XCTAssertEqual(expenseSettings.getFundsEarmarkedForAnnualBills(), expectedFundsEarmarkedForAnnualBills, "Should return 144(annualExpense) / 12(numberOfMonthsToSaveMoney) = 12")
        
    }
    

}
