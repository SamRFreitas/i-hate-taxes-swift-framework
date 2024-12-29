//
//  MockURLSession.swift
//  IHateTaxesTests
//
//  Created by Samuel R de Freitas on 17/12/24.
//

import Foundation

class MockURLSession: URLSession {
    private let mockData: Data?
    private let mockResponse: URLResponse?
    private let mockError: Error?

    init(mockData: Data?, mockResponse: URLResponse?, mockError: Error?) {
        self.mockData = mockData
        self.mockResponse = mockResponse
        self.mockError = mockError
    }

    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return MockURLSessionDataTask {
            completionHandler(self.mockData, self.mockResponse, self.mockError)
        }
    }
}

class MockURLSessionDataTask: URLSessionDataTask {
    private let closure: () -> Void

    init(closure: @escaping () -> Void) {
        self.closure = closure
    }

    override func resume() {
        closure()
    }
}


