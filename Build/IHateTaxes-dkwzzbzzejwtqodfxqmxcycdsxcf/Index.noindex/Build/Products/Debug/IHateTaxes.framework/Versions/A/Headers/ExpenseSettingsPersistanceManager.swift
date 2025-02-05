//
//  ExpenseSettingsPersistanceManager.swift
//  IHateTaxes
//
//  Created by Samuel R de Freitas on 14/01/25.
//

import Foundation

public class ExpenseSettingsManager {
    
    private let storage: UserDefaultsStorage
    private let storageKey = "ExpenseSettingsKey"
    
    public init(storage: UserDefaultsStorage = UserDefaultsStorage()) {
        self.storage = storage
    }
    
    public func saveSettings(_ settings: ExpenseSettings) {
        storage.save(settings, forKey: storageKey)
    }
    
    public func loadSettings() -> ExpenseSettings? {
        return storage.load(forKey: storageKey)
    }
    
    public func updateSettings(_ settings: ExpenseSettings) {
        storage.update(settings, forKey: storageKey)
    }
    
    
    public func deleteSettings() {
        storage.storeEngine.removeObject(forKey: storageKey)
    }
    
}
