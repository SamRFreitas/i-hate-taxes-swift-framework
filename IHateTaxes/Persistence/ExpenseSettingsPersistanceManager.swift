//
//  ExpenseSettingsPersistanceManager.swift
//  IHateTaxes
//
//  Created by Samuel R de Freitas on 14/01/25.
//

import Foundation

class ExpenseSettingsManager {
    
    private let storage: UserDefaultsStorage
    private let storageKey = "ExpenseSettingsKey"
    
    init(storage: UserDefaultsStorage = UserDefaultsStorage()) {
        self.storage = storage
    }
    
    // Salva as configurações de despesas
    func saveSettings(_ settings: ExpenseSettings) {
        storage.save(settings, forKey: storageKey)
    }
    
    // Carrega as configurações de despesas
    func loadSettings() -> ExpenseSettings? {
        return storage.load(forKey: storageKey)
    }
    
    // Atualiza as configurações de despesas
    func updateSettings(_ settings: ExpenseSettings) {
        storage.update(settings, forKey: storageKey)
    }
    
    // Remove as configurações de despesas
    func deleteSettings() {
        storage.storeEngine.removeObject(forKey: storageKey)
    }
    
}
