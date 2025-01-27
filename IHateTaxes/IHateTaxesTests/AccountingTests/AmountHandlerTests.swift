//
//  AmountHandlerTests.swift
//  IHateTaxesTests
//
//  Created by Samuel R de Freitas on 18/12/24.
//

import XCTest

class AmountHandlerTests: XCTestCase {
    
    func testAmountHandlerCalculate() {
        let amountHandler = AmountHandler()
        
        let value = 100.0
        let percentage = 10.0
        let expectedValue = 10.0
        
        let result = amountHandler.calculate(percentage: percentage, of: value)
        
        XCTAssertEqual(result, expectedValue, "Calculation result should be equal to \(expectedValue)")
        
    }
    
    func testRoundDouble() {
        
        let amountHandler = AmountHandler()
        let amount = 24.079999999999984
        
        let expectedRoundedAmount = 24.08
        let result = amountHandler.roundDouble(amount: amount)
    
        XCTAssertEqual(result, expectedRoundedAmount)
        
    }
    
    func testAmountHandlerFormatDecimalDigitsWithDefaultDecimalPlaceValue() {
        
        let amountHandler = AmountHandler()
        
        let amount = 20.0
        let expectedValue = "20.00"
        let result = amountHandler.format(amount: amount)
        
        XCTAssertEqual(result, expectedValue, "Calculation result should be equal to \(expectedValue)")
        
    }
    
    func testAmountHandlerFormatDecimalDigits() {
        
        let amountHandler = AmountHandler()
        
        let amount = 20.0
        let decimalDigits = 3
        let expectedValue = "20.000"
        let result = amountHandler.format(amount: amount, withDecimalPlaces: decimalDigits)
        
        XCTAssertEqual(result, expectedValue, "Calculation result should be equal to \(expectedValue)")
        
    }

}
