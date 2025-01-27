//
//  VrauTests.swift
//  IHateTaxesTests
//
//  Created by Samuel R de Freitas on 29/12/24.
//

import XCTest
@testable import IHateTaxes

final class VrauTests: XCTestCase {

    func testGetAmountForInssCalculationWhenValueIsLesserOrEqualsTo1412() {
        
        let expenseSettings = ExpenseSettings(minimumWage: 1412, proLaborePercentage: 28, contabilizeiMonthlyFee: 0, rental: 120, digitalSignature: 80, numberOfMonthsToSaveMoney: 0, isNational: false)
        
        let expectedMinimumWage: Double = 1412
        let expectedProLaborePercentage: Double = 28
        
        XCTAssertEqual(expenseSettings.minimumWage, expectedMinimumWage)
        XCTAssertEqual(expenseSettings.proLaborePercentage, expectedProLaborePercentage)
        
        let vrau = Vrau(amount: 2000, expenseSettings: expenseSettings)
        
        XCTAssertEqual(vrau.getAmountForInssCalculation(), 1412, "Should be 1412")
        
    }
    
    func testGetAmountForInssCalculationUse28ofAmount() {
        
        let expenseSettings = ExpenseSettings(minimumWage: 1412, proLaborePercentage: 28, contabilizeiMonthlyFee: 0, rental: 120, digitalSignature: 80, numberOfMonthsToSaveMoney: 0, isNational: false)
        
        let expectedMinimumWage: Double = 1412
        let expectedProLaborePercentage: Double = 28
        
        XCTAssertEqual(expenseSettings.minimumWage, expectedMinimumWage)
        XCTAssertEqual(expenseSettings.proLaborePercentage, expectedProLaborePercentage)
        
        let vrau = Vrau(amount: 10000, expenseSettings: expenseSettings)
        
        XCTAssertEqual(vrau.getAmountForInssCalculation(), 2800, "Should be 2800")
        
    }


    
    func testGetDla() {
        
        let mockExpenseSettings = MockExpenseSettings()
        let mockInss = MockInss()
        let mockDas = MockDas()
        
        let vrau1 = Vrau(amount: 2000, expenseSettings: mockExpenseSettings)
        vrau1.configure()
        
        vrau1.inss = mockInss
        vrau1.das = mockDas
        
        XCTAssertEqual(vrau1.getDla(), 667)
        
        let vrau2 = Vrau(amount: 10000, expenseSettings: mockExpenseSettings)
        vrau2.configure()
        
        vrau2.inss = mockInss
        vrau2.das = mockDas
        
        XCTAssertEqual(vrau2.getDla(), 8667)
        
    }
    
    func testPrototype() {
        
        let expenseSettings = ExpenseSettings(minimumWage: 1412, proLaborePercentage: 28, contabilizeiMonthlyFee: 120, rental: 647, digitalSignature: 235, numberOfMonthsToSaveMoney: 12, isNational: false)
        
        let vrau = Vrau(amount: 6000, expenseSettings: expenseSettings)
        vrau.configure()
        
        print("------------------------------------------")
        print("Contabilizei-----------------\(vrau.expenseSettings.contabilizeiMonthlyFee)")
        print("INSS-------------------------\(vrau.inss!.getTax())")
        print("IRRF-------------------------\(vrau.inss!.getIrrfTax())")
        print("DAS--------------------------\(vrau.das!.getTax())")
        print("Despesas Anuais--------------\(vrau.expenseSettings.getFundsEarmarkedForAnnualBills())")
        print("Pró-Labore-------------------\(vrau.inss!.proLabore)")
        print("DLA--------------------------\(vrau.getDla())")
        print("Total de Imposto-------------\(vrau.expenseSettings.contabilizeiMonthlyFee)")
        print("Lucro------------------------\(vrau.inss!.proLabore + vrau.getDla())")
        print("------------------------------------------")
        
    }

}
