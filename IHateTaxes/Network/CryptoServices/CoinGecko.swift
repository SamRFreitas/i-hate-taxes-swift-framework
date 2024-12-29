//
//  CoinGecko.swift
//  IHateTaxes
//
//  Created by Samuel R de Freitas on 12/11/24.
//

import Foundation

class CoinGecko {
    
    private let session: URLSession
    private let baseUrl: String = "https://api.coingecko.com/api/v3/simple/"
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    func getPriceFrom(currencies: [String], fiatTargets: [String], completion: @escaping (Result<[String: [String: Double]], Error>) -> Void) {
        
        let qs = buildGetPriceQueryString(currencies: currencies, fiatTargets: fiatTargets)
            // Definindo a URL
            guard let url = URL(string: "\(baseUrl)price?\(qs)") else {
                completion(.failure(NSError(domain: "URL Error", code: -1, userInfo: nil)))
                return
            }
            
            // Criando a requisição GET
            let request = URLRequest(url: url)
            
            // Iniciando uma sessão de URL
            let task = session.dataTask(with: request) { data, response, error in
                // Checando se houve erro na requisição
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                // Verificando a resposta HTTP
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    completion(.failure(NSError(domain: "HTTP Error", code: -4, userInfo: nil)))
                    return
                }
                
                // Checando se há dados de resposta
                guard let data = data else {
                    completion(.failure(NSError(domain: "No Data", code: -3, userInfo: nil)))
                    return
                }
                
                // Tentando fazer o parse dos dados
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: [String: Double]] {
                        completion(.success(json))
                    } else {
                        completion(.failure(NSError(domain: "Parsing Error", code: -2, userInfo: nil)))
                    }
                } catch {
                    completion(.failure(error))
                }
            }
            
            // Inicia a requisição
            task.resume()
    }
    
    func buildGetPriceQueryString(currencies: [String], fiatTargets: [String]) -> String {
        
        var queryString = "ids="
        
        queryString = concatQuery(params: currencies, initialQueryValue: queryString)
        
        queryString = queryString + "&vs_currencies="
        
        queryString = concatQuery(params: fiatTargets, initialQueryValue: queryString)
        
        return queryString
    }
    
    func concatQuery(params: [String], initialQueryValue: String)  -> String {
        
        var concatenatedParameters: String = initialQueryValue
        
        for param in params {
            
            if param == params.last {
                concatenatedParameters = concatenatedParameters + param
            } else {
                concatenatedParameters = concatenatedParameters + param + ","
            }
           
        }
        
        return concatenatedParameters
        
    }
    
}
