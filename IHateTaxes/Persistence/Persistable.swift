//
//  Persistable.swift
//  IHateTaxes
//
//  Created by Samuel R de Freitas on 09/01/25.
//

import Foundation

protocol Persistable {
    
    associatedtype StoreEngine
    var storeEngine: StoreEngine { get }
    
    func save<T: Codable>(_ data: T, forKey key: String)
    func load<T: Codable>(forKey key: String) -> T?
    func update<T: Codable>(_ data: T, forKey key: String)
    
}
