//
//  NetworkManager.swift
//  IHateTaxes
//
//  Created by Samuel R de Freitas on 11/11/24.
//

import Foundation

class NetworkManager {
    
    init() {}
    
    func testFunc() {
        print("mandioca")
    }
    
    func makeGETRequest(completion: @escaping () -> Void) {
        // Definindo a URL
        guard let url = URL(string: "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,tether&vs_currencies=usd,brl") else {
            print("URL inválida")
            return
        }
        
        // Criando a requisição GET
        let request = URLRequest(url: url)
        
        // Iniciando uma sessão de URL
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Checando se houve erro na requisição
            if let error = error {
                print("Erro na requisição: \(error)")
                return
            }
            
            // Verificando a resposta HTTP
            if let httpResponse = response as? HTTPURLResponse {
                print("Status Code: \(httpResponse.statusCode)")
            }
            
            // Checando se há dados de resposta
            if let data = data {
                // Tentando fazer o parse dos dados (no exemplo vamos supor que é JSON)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print("Resposta JSON: \(json)")
                } catch {
                    print("Erro ao parsear os dados: \(error)")
                }
            }
            
            // Chama o closure quando a requisição for completada
            completion()
        }
        
        // Inicia a requisição
        task.resume()
    }
    
}
