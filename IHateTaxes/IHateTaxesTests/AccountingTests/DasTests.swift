//
//  DasTests.swift
//  IHateTaxesTests
//
//  Created by Samuel R de Freitas on 18/12/24.
//

import XCTest
@testable import IHateTaxes

final class DasTests: XCTestCase {

    func testGetDasTaxWhenIsNotNational() {
        
        let expectedDasTax: Double = 3.05
        let das = Das(amount: 100)
        
        XCTAssertEqual(das.getTax(), expectedDasTax, "Should return 3.05")
        
    }
    
    func testGetDasTaxWhenIsNational() {
        
        let expectedDasTax: Double = 6.5
        let das = Das(amount: 100, isNational: true)
        
        XCTAssertEqual(das.getTax(), expectedDasTax, "Should return 6.5")
        
    }

}
