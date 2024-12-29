//
//  EchangeRateTests.swift
//  IHateTaxesTests
//
//  Created by Samuel R de Freitas on 12/11/24.
//

import XCTest
@testable import IHateTaxes


final class EchangeRateTests: XCTestCase {
    
    var exchangeRate: ExchangeRate!

    override func setUp() {
        super.setUp()
        exchangeRate = ExchangeRate()
    }
    
    func testGetLatestConversionRatesBasedOn() {
        
        let expectation = self.expectation(description: "Requisição de rede concluída")
        
        let mockData: [String: Any] = [
            "conversion_rates": [
                "BRL": 5.0,
                "USD": 1.0
            ]
        ]
            
        let jsonData = try! JSONSerialization.data(withJSONObject: mockData, options: [])
        
        let mockResponse = HTTPURLResponse(url: URL(string: "https://api.coingecko.com/api/v3/simple/price")!,
                                            statusCode: 200,
                                            httpVersion: nil,
                                            headerFields: nil)
        
        let mockSession = MockURLSession(mockData: jsonData, mockResponse: mockResponse, mockError: nil)
        
        let exchangeRate = ExchangeRate(session: mockSession)

        // Executando a requisição
        exchangeRate.getLatestConversionRatesBasedOn(currencyCode: "USD") { result in
            // Quando a requisição for concluída, chamamos 'fulfill' para liberar a expectativa
          
            switch result {
            case .success(let response):
                if let conversionRates = mockData["conversion_rates"] as? [String: Double] {
                    XCTAssertEqual(response["BRL"], conversionRates["BRL"])
                    XCTAssertEqual(response["USD"], conversionRates["USD"])
                } else {
                    XCTFail("Dados de teste inválidos.")
                }
            case .failure(let error):
                XCTFail("Erro inesperado: \(error.localizedDescription)")
            }
            
            expectation.fulfill()
            
        }
        
        // Espera a expectativa ser cumprida, com um tempo limite
        wait(for: [expectation], timeout: 10.0)
        
    }

}
