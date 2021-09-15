//
//  CoinViewModel.swift
//  MVVMArchitecture
//
//  Created by Ömer Can Koç on 15.09.2021.
//

import Foundation

struct CoinListViewModel {
    let coinCurrencyList : [CoinModel]
}

struct CoinViewModel {
    let coinCurrency : CoinModel
}

extension CoinListViewModel {
    func numberOfRowsInSection() -> Int {
        return self.coinCurrencyList.count
    }
    
    func coinIndex(_ index : Int) -> CoinViewModel {
        let coin = self.coinCurrencyList[index]
        return CoinViewModel(coinCurrency: coin)
    }
}

extension CoinViewModel {
    var currency : String {
        return self.coinCurrency.currency
    }
    
    var price : String {
        return self.coinCurrency.price
    }
}
