//
//  Parser.swift
//  OTUS-GPB-URLSESSION-HW
//
//  Created by Aleksandr Chebotarev on 12/22/22.
//

import Foundation

class Parser {
    static let shared = Parser()
    
    let link = "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c"
    
    func getData(completion: @escaping (Model) -> ()) {
        guard let url = URL(string: link) else { return print("Error!") }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let obtainedData = data else { return print("No data") }
            do {
                let decodedData = try JSONDecoder().decode(Model.self, from: obtainedData)
                DispatchQueue.main.async {
                    completion(decodedData)
                }
            } catch {
                print("Error")
            }
        }.resume()
    }
}
