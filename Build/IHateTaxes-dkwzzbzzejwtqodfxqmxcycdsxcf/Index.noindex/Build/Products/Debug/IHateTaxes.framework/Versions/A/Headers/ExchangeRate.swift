//
//  ExchangeRate.swift
//  IHateTaxes
//
//  Created by Samuel R de Freitas on 12/11/24.
//

import Foundation

class ExchangeRate {
    
    private let session: URLSession
    private let baseUrl: String = "https://v6.exchangerate-api.com/v6/"
    private let apiKey: String = "6b1e81dc4fb21c8ee0cce747"
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func getLatestConversionRatesBasedOn(currencyCode: String,  completion: @escaping (Result<[String: Double], Error>) -> Void) {
        // Definindo a URL
        guard let url = URL(string: "\(baseUrl)\(apiKey)/latest/\(currencyCode)") else {
            print("URL inválida")
            return
        }
        
        // Criando a requisição GET
        let request = URLRequest(url: url)
        
        // Iniciando uma sessão de URL
        let task = session.dataTask(with: request) { data, response, error in
            // Checando se houve erro na requisição
            if let error = error {
                print("Erro na requisição: \(error)")
                return
            }
            
            // Verificando a resposta HTTP
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NSError(domain: "HTTP Error", code: -4, userInfo: nil)))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: -3, userInfo: nil)))
                return
            }

            // Checando se há dados de resposta
            
            do {
                // Fazendo o parse dos dados
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
//                print(json!)
                
                if let conversionRates = json?["conversion_rates"] as? [String: Double] {
                    
                    var rates: [String: Double] = [:]
                       
                   if let brlRate = conversionRates["BRL"] {
                       rates["BRL"] = brlRate
                   }
                   if let usdRate = conversionRates["USD"] {
                       rates["USD"] = usdRate
                   }
                    
                    print(rates)
                    completion(.success(rates))
                    
                } else {
                    print("Não foi possível encontrar os dados de conversion_rates.")
                    completion(.failure(NSError(domain: "Parsing Error", code: -2, userInfo: nil)))

                }
            } catch {
                print("Erro ao parsear os dados: \(error)")
                completion(.failure(NSError(domain: "Parsing Error", code: -2, userInfo: nil)))

            }
            
        }
        
        // Inicia a requisição
        task.resume()
    }
    
}
