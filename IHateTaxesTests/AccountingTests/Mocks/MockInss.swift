//
//  MockInss.swift
//  IHateTaxesTests
//
//  Created by Samuel R de Freitas on 29/12/24.
//

import Foundation
@testable import IHateTaxes

class MockInss: Inss {
    
    init() {
        super.init(amount: 1000)
    }
    
    override func getTax() -> Double {
        return 10
    }
    
    override func getIrrfTax() -> Double {
        return 100
    }
    
}
