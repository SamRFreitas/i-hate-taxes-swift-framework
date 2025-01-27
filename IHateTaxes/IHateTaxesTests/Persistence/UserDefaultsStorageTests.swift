//
//  UserDefaultsStorageTests.swift
//  IHateTaxesTests
//
//  Created by Samuel R de Freitas on 14/01/25.
//

import XCTest
@testable import IHateTaxes

final class UserDefaultsStorageTests: XCTestCase {

    var storage: UserDefaultsStorage!
    let testKey = "TestKey"
    
    override func setUp() {
        super.setUp()
        storage = UserDefaultsStorage()
        UserDefaults.standard.removeObject(forKey: testKey)
    }
    
    override func tearDown() {
        UserDefaults.standard.removeObject(forKey: testKey)
        super.tearDown()
    }
    
    func testSaveAndLoad() {
        let testObject = ExpenseSettings(
            minimumWage: 1320.0,
            proLaborePercentage: 10.0,
            contabilizeiMonthlyFee: 100.0,
            rental: 1500.0,
            digitalSignature: 200.0,
            numberOfMonthsToSaveMoney: 12,
            isNational: true
        )
        
        storage.save(testObject, forKey: testKey)
        let loadedObject: ExpenseSettings? = storage.load(forKey: testKey)
        
        XCTAssertNotNil(loadedObject, "O objeto carregado não deve ser nil.")
        XCTAssertEqual(loadedObject?.minimumWage, testObject.minimumWage, "O salário mínimo carregado está incorreto.")
        XCTAssertEqual(loadedObject?.isNational, testObject.isNational, "O valor 'isNational' carregado está incorreto.")
    }
    
    func testUpdate() {
        var testObject = ExpenseSettings(
            minimumWage: 1320.0,
            proLaborePercentage: 10.0,
            contabilizeiMonthlyFee: 100.0,
            rental: 1500.0,
            digitalSignature: 200.0,
            numberOfMonthsToSaveMoney: 12,
            isNational: true
        )
        
        storage.save(testObject, forKey: testKey)
        
        testObject.minimumWage = 1400.0
        storage.update(testObject, forKey: testKey)
        
        let updatedObject: ExpenseSettings? = storage.load(forKey: testKey)
        
        XCTAssertNotNil(updatedObject, "O objeto atualizado não deve ser nil.")
        XCTAssertEqual(updatedObject?.minimumWage, 1400.0, "O salário mínimo atualizado está incorreto.")
    }

}
