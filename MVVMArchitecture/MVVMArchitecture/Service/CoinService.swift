//
//  CoinService.swift
//  MVVMArchitecture
//
//  Created by Ömer Can Koç on 15.09.2021.
//

import Foundation

class CoinService {
    func downloadCoins(url : URL, completion : @escaping([CoinModel]?) -> ()){
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let coins = try? JSONDecoder().decode([CoinModel].self, from: data)
                print(coins)
                if let coins = coins {
                    completion(coins)
                }
            }
        }.resume()
    }
}
