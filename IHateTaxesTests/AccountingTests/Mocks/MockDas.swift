//
//  MockDas.swift
//  IHateTaxesTests
//
//  Created by Samuel R de Freitas on 29/12/24.
//

import Foundation
@testable import IHateTaxes

class MockDas: Das {
    
    init() {
        super.init(amount: 0, isNational: false)
    }
    
    override func getTax() -> Double {
        return 3
    }
    
}
