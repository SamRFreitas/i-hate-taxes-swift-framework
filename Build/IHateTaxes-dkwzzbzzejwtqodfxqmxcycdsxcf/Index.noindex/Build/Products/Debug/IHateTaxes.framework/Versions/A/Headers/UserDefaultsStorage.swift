//
//  UserDefaultsStorage.swift
//  IHateTaxes
//
//  Created by Samuel R de Freitas on 09/01/25.
//

import Foundation

public struct UserDefaultsStorage: Persistable {
    
    public typealias StoreEngine = UserDefaults
    
    public var storeEngine: UserDefaults
    
    public init(storeEngine: UserDefaults = .standard) {
        self.storeEngine = storeEngine
    }
    
    public func save<T: Codable>(_ data: T, forKey key: String) {
        if let encoded = try? JSONEncoder().encode(data) {
            storeEngine.set(encoded, forKey: key)
        }
    }
    
    public func load<T: Codable>(forKey key: String) -> T? {
        if let savedData = storeEngine.data(forKey: key),
           let decoded = try? JSONDecoder().decode(T.self, from: savedData) {
            return decoded
        }
        return nil
    }
    
    public func update<T: Codable>(_ data: T, forKey key: String) {
        save(data, forKey: key)
    }
    
}
