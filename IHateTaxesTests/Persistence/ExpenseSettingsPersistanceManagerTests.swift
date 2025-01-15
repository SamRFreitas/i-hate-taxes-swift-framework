//
//  ExpenseSettingsPersistanceManagerTests.swift
//  IHateTaxesTests
//
//  Created by Samuel R de Freitas on 14/01/25.
//

import XCTest
@testable import IHateTaxes

final class ExpenseSettingsPersistanceManagerTests: XCTestCase {

    var manager: ExpenseSettingsManager!
        
    override func setUp() {
        super.setUp()
        manager = ExpenseSettingsManager()
    }

    override func tearDown() {
        manager.deleteSettings()
        super.tearDown()
    }

    func testSaveAndLoadSettings() {
        let settings = ExpenseSettings(
            minimumWage: 1320.0,
            proLaborePercentage: 10.0,
            contabilizeiMonthlyFee: 100.0,
            rental: 1500.0,
            digitalSignature: 200.0,
            numberOfMonthsToSaveMoney: 12,
            isNational: true
        )
        
        manager.saveSettings(settings)
        let loadedSettings = manager.loadSettings()
        
        XCTAssertNotNil(loadedSettings, "As configurações carregadas não devem ser nil.")
        XCTAssertEqual(loadedSettings?.minimumWage, settings.minimumWage, "O salário mínimo carregado está incorreto.")
    }

    func testDeleteSettings() {
        let settings = ExpenseSettings(
            minimumWage: 1320.0,
            proLaborePercentage: 10.0,
            contabilizeiMonthlyFee: 100.0,
            rental: 1500.0,
            digitalSignature: 200.0,
            numberOfMonthsToSaveMoney: 12,
            isNational: true
        )
        
        manager.saveSettings(settings)
        manager.deleteSettings()
        
        let loadedSettings = manager.loadSettings()
        
        XCTAssertNil(loadedSettings, "As configurações devem ser nil após serem deletadas.")
    }
}
