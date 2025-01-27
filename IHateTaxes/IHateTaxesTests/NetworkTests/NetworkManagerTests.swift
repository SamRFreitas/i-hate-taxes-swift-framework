//
//  NetworkManagerTests.swift
//  IHateTaxesTests
//
//  Created by Samuel R de Freitas on 11/11/24.
//

import XCTest
@testable import IHateTaxes
final class NetworkManagerTests: XCTestCase {
    
    var networkManager: NetworkManager!
    
    override func setUp() {
        super.setUp()
        networkManager = NetworkManager() // Inicialize o networkManager antes de cada teste
    }
    
    override func tearDown() {
        networkManager = nil // Limpeza após o teste
        super.tearDown()
    }
   
    func testNetworkRequest() {
        
    }
}
