//
//  InssTests.swift
//  IHateTaxesTests
//
//  Created by Samuel R de Freitas on 18/12/24.
//

import XCTest
@testable import IHateTaxes

final class InssTests: XCTestCase {

    func testgetTax() {
        
        let inss = Inss(amount: 1420)
         
        let expectedValue = 156.2
        let taxValue = inss.getTax()
        
        XCTAssertEqual(taxValue, expectedValue)
        
    }
    
    func testGetFirstIrrfDeduction() {
        
        let irrfDeduction = IrrfDeduction(amountWithoutTax: 1903.98)
         
        let expectedIrrfDeductionAliquot = 0.0
        let expectedIrrfDeductionValue = 0.0
        
        XCTAssertEqual(irrfDeduction.aliquot, expectedIrrfDeductionAliquot)
        XCTAssertEqual(irrfDeduction.value, expectedIrrfDeductionValue)
        
    }
    
    func testGetSecondIrrfDeduction() {
        
        let irrfDeduction = IrrfDeduction(amountWithoutTax: 2200)
         
        let expectedIrrfDeductionAliquot = 7.5
        let expectedIrrfDeductionValue = 142.8
        
        XCTAssertEqual(irrfDeduction.aliquot, expectedIrrfDeductionAliquot)
        XCTAssertEqual(irrfDeduction.value, expectedIrrfDeductionValue)
        
    }
    
    func testGetThirdIrrfDeduction() {
        
        let irrfDeduction = IrrfDeduction(amountWithoutTax: 3200)
         
        let expectedIrrfDeductionAliquot = 15.0
        let expectedIrrfDeductionValue = 354.8
        
        XCTAssertEqual(irrfDeduction.aliquot, expectedIrrfDeductionAliquot)
        XCTAssertEqual(irrfDeduction.value, expectedIrrfDeductionValue)
        
    }
    
    func testGetFourthIrrfDeduction() {
        
        let irrfDeduction = IrrfDeduction(amountWithoutTax: 4500)
         
        let expectedIrrfDeductionAliquot = 22.5
        let expectedIrrfDeductionValue = 636.13
        
        XCTAssertEqual(irrfDeduction.aliquot, expectedIrrfDeductionAliquot)
        XCTAssertEqual(irrfDeduction.value, expectedIrrfDeductionValue)
        
    }
    
    func testGetFifthIrrfDeduction() {
        
        let irrfDeduction = IrrfDeduction(amountWithoutTax: 6000)
         
        let expectedIrrfDeductionAliquot = 27.5
        let expectedIrrfDeductionValue = 869.36
        
        XCTAssertEqual(irrfDeduction.aliquot, expectedIrrfDeductionAliquot)
        XCTAssertEqual(irrfDeduction.value, expectedIrrfDeductionValue)
        
    }
    
    func testFirstScenarioCalcualteIrrfTax() {
        
        let inns = Inss(amount: 1903.98)
        let expectedIrrfTax = 0.0
        let irrfTax = inns.getIrrfTax()
        
        XCTAssertEqual(irrfTax, expectedIrrfTax, "Aliquot equals to 0% and deduction equals to 0")
        
        
    }
    
    func testSecondScenarioCalcualteIrrfTax() {
        
        let inns = Inss(amount: 1903.98)
        let expectedIrrfTax = 0.0
        let irrfTax = inns.getIrrfTax()
        
        XCTAssertEqual(irrfTax, expectedIrrfTax, "Aliquot equals to 7.5% and deduction equals to 142.80, but irrf is negative")
        
    }
    
    func testThirdScenarioCalcualteIrrfTax() {
        
        let inns = Inss(amount: 2500)
        let expectedIrrfTax = 24.08
        let irrfTax = inns.getIrrfTax()
        
        XCTAssertEqual(irrfTax, expectedIrrfTax, "Aliquot equals to 7.5% and deduction equals to 142.80")
        
    }
    
    func testFourthScenarioCalcualteIrrfTax() {
        
        let inns = Inss(amount: 3200)
        let expectedIrrfTax = 72.4
        let irrfTax = inns.getIrrfTax()
        
        XCTAssertEqual(irrfTax, expectedIrrfTax, "Aliquot equals to 15% and deduction equals to 354.80")
        
    }
    
    func testFifthScenarioCalcualteIrrfTax() {
        
        let inns = Inss(amount: 4500)
        let expectedIrrfTax = 265.0
        let irrfTax = inns.getIrrfTax()
        
        XCTAssertEqual(irrfTax, expectedIrrfTax, "Aliquot equals to 22,5% and deduction equals to 636,13")
        
    }
    
    func testSixthScenarioCalcualteIrrfTax() {
        
        let inns = Inss(amount: 6000)
        let expectedIrrfTax = 599.14
        let irrfTax = inns.getIrrfTax()
        
        XCTAssertEqual(irrfTax, expectedIrrfTax, "Aliquot equals to 27,5% and deduction equals to 869,36")
        
    }
    
    func testCalculateInss() {
        
        let inns = Inss(amount: 5200)
        
        let expectedInssTax = 572.0
        let expectedIrrfTax = 405.17
        
        let inssTax = inns.getTax()
        let irrfTax = inns.getIrrfTax()
        
        XCTAssertEqual(inssTax, expectedInssTax)
        XCTAssertEqual(irrfTax, expectedIrrfTax)
        
    }

}
