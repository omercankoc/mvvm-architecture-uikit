//
//  Requests.swift
//  MVVMUIKit
//
//  Created by Ömer Can Koç on 11.01.2023.
//

import Foundation

enum GetError : Error {
    case badURL
    case noData
    case dataParseError
}

class Requests {
    
    func getCountriesRequest(url : URL , completion : @escaping ([CountryModel]?) -> ()){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let countries = try? JSONDecoder().decode([CountryModel].self, from: data)
                if let countries = countries { completion(countries) }
            }
        }.resume()
    }
}
