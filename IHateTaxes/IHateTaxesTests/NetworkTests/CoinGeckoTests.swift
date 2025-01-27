//
//  CoinGeckoTests.swift
//  IHateTaxesTests
//
//  Created by Samuel R de Freitas on 12/11/24.
//

import XCTest

@testable import IHateTaxes

final class CoinGecjoTests: XCTestCase {
    
    var coinGecko: CoinGecko!

    override func setUp() {
        super.setUp()
        coinGecko = CoinGecko()
    }
    
    func testGetPriceFrom() {
        
        let expectation = self.expectation(description: "Requisição de rede concluída")
        
        let mockData: [String: [String: Double]] = [
            "tether": ["brl": 5.0, "usd": 1.0],
            "bitcoin": ["brl": 500000.0, "usd": 100000.0]
            ]
            
        let jsonData = try! JSONSerialization.data(withJSONObject: mockData, options: [])
        
        let mockResponse = HTTPURLResponse(url: URL(string: "https://api.coingecko.com/api/v3/simple/price")!,
                                            statusCode: 200,
                                            httpVersion: nil,
                                            headerFields: nil)
        
        let mockSession = MockURLSession(mockData: jsonData, mockResponse: mockResponse, mockError: nil)
        
        let coinGecko = CoinGecko(session: mockSession)
        
        coinGecko.getPriceFrom(currencies: ["bitcoin", "tether"], fiatTargets: ["usd", "brl"]) { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(response["tether"]?["brl"], mockData["tether"]?["brl"])
                XCTAssertEqual(response["tether"]?["usd"], mockData["tether"]?["usd"])
                XCTAssertEqual(response["bitcoin"]?["brl"], mockData["bitcoin"]?["brl"])
                XCTAssertEqual(response["bitcoin"]?["usd"], mockData["bitcoin"]?["usd"])
            case .failure(let error):
                XCTFail("Erro inesperado: \(error.localizedDescription)")
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 10.0)
        
    }
    
    func testBuildQueryString() {
        
        
        let queryStringWithMoreThanOneCurrenciesAndFiats = coinGecko.buildGetPriceQueryString(currencies: ["bitcoin", "tether"], fiatTargets: ["usd", "brl"])
        
        XCTAssertEqual(queryStringWithMoreThanOneCurrenciesAndFiats, "ids=bitcoin,tether&vs_currencies=usd,brl")
        
        let queryStringWithJustOneCurrencyAndFiatTarget = coinGecko.buildGetPriceQueryString(currencies: ["bitcoin"], fiatTargets: ["usd"])
        
        XCTAssertEqual(queryStringWithJustOneCurrencyAndFiatTarget, "ids=bitcoin&vs_currencies=usd")
        
    }
    
    func testConcatQueryParams() {
        
        let queryWithMoreThanOneParams = coinGecko.concatQuery(params: ["abc", "def"], initialQueryValue: "test=")
        
        XCTAssertEqual(queryWithMoreThanOneParams, "test=abc,def")
        
        let queryWithJustOneParam = coinGecko.concatQuery(params: ["abc"], initialQueryValue: "test=")
        
        XCTAssertEqual(queryWithJustOneParam, "test=abc")

    }

}
